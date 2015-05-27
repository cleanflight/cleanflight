"""Convert ROS format messages to Clearflight format encoders."""

import collections
import re
import sys

import genmsg.msgs
import genmsg.template_tools

Env = collections.namedtuple('Env', 'spec msg_context search_path')

# Details on the native version of a ROS type.
Type = collections.namedtuple('Type', 'name size encoder')

# All base types.
MSG_TYPES = {
    'char': Type('char', 1, '8'),
    'bool': Type('bool', 1, '8'),
    'uint8': Type('uint8_t', 1, '8'),
    'int8': Type('int8_t', 1, '8'),
    'uint16': Type('uint16_t', 2, '16'),
    'int16': Type('int16_t', 2, '16'),
    'uint32': Type('uint32_t', 4, '32'),
    'int32': Type('int32_t', 4, '32'),
    'uint64': Type('uint64_t', 8, '64'),
    'int64': Type('int64_t', 8, '64'),
    'float32': Type('float', 4, 'Float'),
    'float64': Type('double', 8, 'Double'),
    'string': Type('const char *', None, 'String'),
    'time': Type('ros::Time', 4, '32'),
    'duration': Type('ros::Duration', 4, '32'),
}


def make_env(spec, msg_context, search_path):
    """Wrap commonly used arguments up into an environment."""
    return Env(spec, msg_context, search_path)


def load_spec(typename, spec, env):
    """Find and load the spec of the given message type."""
    t = genmsg.msgs.resolve_type(typename, spec.package)
    assert isinstance(env.search_path, dict)
    return genmsg.msg_loader.load_msg_by_type(
        env.msg_context, t, env.search_path)


def get_type(typename):
    """Gets the type of a basic type.

    Returns None for other types.

    """
    base_type, _, _ = genmsg.msgs.parse_type(typename)
    return MSG_TYPES.get(base_type, None)


def to_caps(name):
    """Convers a CamelCase string to CAPS_CASE."""
    return re.sub(r'([a-z])([A-Z])', r'\1_\2', name).upper()


def _multiply(left, right):
    """Returns a pretty string version of multiplying the arguments."""
    if left == 1:
        return right
    else:
        return '{}*{}'.format(left, right)


def _lcfirst(name):
    """Converts the first letter of the string to lower case."""
    return name[0].lower() + name[1:]


def get_length(field, spec, env):
    """Returns the byte length of a field as a string."""
    ctype = get_type(field.type)
    if ctype is not None:
        # A base type.
        if field.base_type == 'string':
            if get_count(field) != 1:
                raise RuntimeError(
                    ('{}: support for arrays of strings is not '
                     'implemented'.format(field.name)))
            return 'strlen({})'.format(field.name)
        else:
            return _multiply(get_count(field), ctype.size)
    else:
        # Load the message and return the size of it.
        child = load_spec(field.base_type, spec, env)
        sizes = (str(get_length(x, child, env)) for x in child.parsed_fields())
        joined = '({})'.format(' + '.join(sizes))
        return _multiply(get_count(field), joined)


def get_count(field):
    """Returns the number of items in a field."""
    if not field.is_array:
        return 1
    if field.array_len is not None:
        return field.array_len
    # Return the name of the parameter that holds the length.
    return 'n{}'.format(field.name)


def _msg_type_to_cpp(name, spec, env):
    base_type, is_array, _ = genmsg.msgs.parse_type(name)
    ctype = get_type(base_type)
    if ctype:
        if is_array:
            return 'const {} *'.format(ctype.name)
        else:
            return ctype.name
    else:
        if '/' in base_type:
            # Use the short type.
            base_type = base_type.split('/')[-1]
        # Check if the message overrides the native type name.
        child = load_spec(base_type, spec, env)
        constants = {x.name: x.val for x in child.constants}
        ctype = constants.get('clearflight_type', base_type)
        if ctype == 'auto':
            # Remap messages named FooBar to fooBar_t
            ctype = _lcfirst(base_type) + '_t'
        return 'const {} *'.format(ctype)


def generate_encoder_args(spec, env):
    """Generates the function arguments for each field."""
    for field in spec.parsed_fields():
        ctype = get_type(field.base_type)
        cname = _msg_type_to_cpp(field.base_type, spec, env)
        if ctype is None:
            yield '{}{}'.format(cname, field.name)
            if field.is_array and field.array_len is None:
                yield 'int n{}'.format(field.name)
        else:
            if field.is_array:
                yield 'const {} *{}'.format(cname, field.name)
                if field.array_len is None:
                    yield 'int n{}'.format(field.name)
            else:
                yield '{} {}'.format(cname, field.name)


def main():
    msg_template_map = {'msg.h.template': '@NAME@.h'}

    genmsg.template_tools.generate_from_command_line_options(
        sys.argv, msg_template_map, None)

if __name__ == '__main__':
    main()
