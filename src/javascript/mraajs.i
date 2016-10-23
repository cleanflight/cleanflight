%module (docstring="Javascript interface to libmraa") mraa

%feature("autodoc", "3");

%include carrays.i
%include cpointer.i
%array_class(uint8_t, uint8Array);

%inline %{
  #include <node_buffer.h>
%}

%typemap(in) (const char* data, int length) {
  if (!node::Buffer::HasInstance($input)) {
      SWIG_exception_fail(SWIG_ERROR, "Expected a node Buffer");
  }
  $1 = (char*) node::Buffer::Data($input);
  $2 = node::Buffer::Length($input);
}

%typemap(in) (const uint8_t *data, int length) {
  if (!node::Buffer::HasInstance($input)) {
      SWIG_exception_fail(SWIG_ERROR, "Expected a node Buffer");
  }
  $1 = (uint8_t*) node::Buffer::Data($input);
  $2 = node::Buffer::Length($input);
}

%typemap(in) (uint8_t *txBuf, int length) {
  if (!node::Buffer::HasInstance($input)) {
      SWIG_exception_fail(SWIG_ERROR, "Expected a node Buffer");
  }
  $1 = (uint8_t*) node::Buffer::Data($input);
  $2 = node::Buffer::Length($input);
}

%typemap(in) (v8::Handle<v8::Function> func) {
  $1 = v8::Local<v8::Function>::Cast($input);
}

namespace mraa {
class Spi;
%typemap(out) uint8_t*
{
%#if SWIG_V8_VERSION > 0x040000
   v8::MaybeLocal<v8::Object> objret = node::Buffer::Copy(v8::Isolate::GetCurrent(), (char*) result, arg3);
   free(result);
   if(!objret.ToLocal(&$result)){
	SWIG_exception_fail(SWIG_ERROR, "Spi buffer failed");
   }
%#elif SWIG_V8_VERSION > 0x032870
  $result = node::Buffer::New((char*) result, arg3);
  free(result);
%#else
  $result = node::Buffer::New((char*) result, arg3)->handle_;
  free(result);
%#endif
}
}

%newobject Uart::read(char* data, int length);
%newobject I2c::read(uint8_t *data, int length);
%newobject Spi::write(uint8_t *data, int length);

//Uart::read()
%typemap(in) (char* data, int length) {
   int x;
   int ecode = SWIG_AsVal_int($input, &x);
   if (!SWIG_IsOK(ecode)) {
     SWIG_exception_fail(SWIG_ArgError(ecode), "Expected an int");
   }
   $2 = x;
   if ($2 < 0) {
       SWIG_exception_fail(SWIG_ERROR, "Positive integer expected");
   }
   $1 = (char*) malloc($2 * sizeof(uint8_t));
}

%typemap(argout) (char* data, int length) {
   if (result < 0) {      /* Check for I/O error */
       free($1);
       SWIG_exception_fail(SWIG_ERROR, "Uart write failed");
   }
%#if SWIG_V8_VERSION > 0x040000
   v8::MaybeLocal<v8::Object> objret = node::Buffer::Copy(v8::Isolate::GetCurrent(), (char*) $1, result);
   free($1);
   if(!objret.ToLocal(&$result)) {
      SWIG_exception_fail(SWIG_ERROR, "Uart buffer failed");
   }
%#elif SWIG_V8_VERSION > 0x032870
   $result = node::Buffer::New((char*) $1, result);
   free($1);
%#else
   $result = node::Buffer::New((char*) $1, result)->handle_;
   free($1);
%#endif

}

//I2c::read()
%typemap(in) (uint8_t *data, int length) {
   int x;
   int ecode = SWIG_AsVal_int($input, &x);
   if (!SWIG_IsOK(ecode)) {
     SWIG_exception_fail(SWIG_ArgError(ecode), "Expected an int");
   }
   $2 = x;
   if ($2 < 0) {
       SWIG_exception_fail(SWIG_ERROR, "Positive integer expected");
   }
   $1 = (uint8_t*) malloc($2 * sizeof(uint8_t));
}

%typemap(argout) (uint8_t *data, int length) {
   if (result < 0) {      /* Check for I/O error */
       free($1);
       SWIG_exception_fail(SWIG_ERROR, "I2c write failed");
   }
%#if SWIG_V8_VERSION > 0x040000
   v8::MaybeLocal<v8::Object> objret = node::Buffer::Copy(v8::Isolate::GetCurrent(), (char*) $1, result);
   free($1);
   if(!objret.ToLocal(&$result)) {
      SWIG_exception_fail(SWIG_ERROR, "I2c buffer failed");
   }
%#elif SWIG_V8_VERSION > 0x032870
   $result = node::Buffer::New((char*) $1, result);
   free($1);
%#else
   $result = node::Buffer::New((char*) $1, result)->handle_;
   free($1);
%#endif
}

%include ../mraa.i

%init %{
    //Adding mraa_init() to the module initialisation process
    if (mraa_init() != MRAA_SUCCESS) {
      // FIXME: Figure out why SWIG_Error causes seg fault.
      // Warn on stderr for time being
      // SWIG_Error(SWIG_RuntimeError, "mraa_init() failed");
      fprintf(stderr, "Javascript Runtime Error: mraa_init() failed.\n");
    }
%}
