The purpose of this document is to explain the basic objectives of Cleanflight's Makefile (those that are relevant to our project), and the way it achieves those objectives. The actual file is much more complex, and serves several other functions than those listed here. But I think this is a decent 30,000' view, and should help us narrow-in on the files we'll need to alter for this port.

For more information on Makefiles, please see the GNU make manual: https://www.gnu.org/software/make/manual/make.html


## The basic objectives of the Makefile are:

1. Select a group of .c source files depending on the version of microprocessor in the FC (STM32F1, STM32F2, STM32F3, STM32F4, or STM32F7)
2. Compile those .c files into .s files (assembly language)
3. Assemble the .s files into .o files (machine language)
4. Link the .o files using an .elf file
5. Create the final executable file (.hex or .bin, to be flashed onto the FC's processor)

## 1. Source File Selection

Makefile first selects a group of .c files depending on the kind of microprocessor in the FC. These source files are stored as a concatenated string in the variable SRC. For more details of exactly how SRC is created and which files comprise it, see source.mk located at ./make/source.mk.

![SRC.png](https://i.postimg.cc/0Qt3dwhJ/SRC.png)

^*What SRC looks like using SPRACINGF3 as the target*

Once SRC is populated, Makefile creates a directory address for a .o file for each .c file listed in $(SRC). These directory addresses are stored as a concatenated string in the variable TARGET_OBJS, and will be used in the next step to compile the .c source files into .s files.

![TARGET-OBJS-declaration.png](https://i.postimg.cc/sxCrZSW9/TARGET-OBJS-declaration.png)

^*Assignment of TARGET_OBJS variable*

![TARGET-OBJS.png](https://i.postimg.cc/GhJXRYmw/TARGET-OBJS.png)

^*What TARGET_OBJS looks like using SPRACINGF3 as the target*

## 2. Compilation

Next, Makefile compiles all of the .c files included in SRC into .s files. It does this by following the rule in the screenshot below:

![Compile-declaration.png](https://i.postimg.cc/T13c0NnR/Compile-declaration.png)

^*Makefile's compile rule*

This rule states:

- For every .o directory address listed in TARGET_OBJS, compile a .s file using its .c counterpart (listed in SRC).
- If a .c file is included in the SPEED_OPTIMISED_SRC list (found in source.mk), compile the .s file using the optimization option CC_SPEED_OPTIMISATION (defined on line 202 of Makefile). This option is pretty self-explanatory, it compiles a .s file optimized for speed.
- If a .c file is included in the SIZE_OPTIMISED_SRC list (found in source.mk), compile the .s file using the optimization option CC_SIZE_OPTIMISATION (defined on line 203 of Makefile). This option compiles a .s file optimized for size.
- Lastly, if the .c file isn't included in either list, use the CC_DEFAULT_OPTIMISATION option defined on line 201.

This rule will run, like a loop, until each .c file in SRC has been compiled into a .s assembly file and stored at ./obj/main/[target-name].

## 3. Assembly

Next, Makefile will assemble all of the .s files into .o files. It does this by following the rule in the screenshot below:

![Asseble-declaration.png](https://i.postimg.cc/FKv3GnQ2/Asseble-declaration.png)

^*Makefile's assemble rule*

This rule follows the same general structure as the compilation rule. It states:

- For every .s file found within the directory adress ./obj/main/[target-name], assemble a .o file.
- For every .S file found within the directory adress ./obj/main/[target-name], assemble a .o file. (This instruction is essentially only for the processor's .S startup file)

## 4. Linking

Finally, Makefile links the individual .o files using a .elf file. It creates the .elf file by following the rule in the screenshot below:

![Linking-declaration.png](https://i.postimg.cc/668c8g60/Linking-declaration.png)

^*Makefile's link rule*

This rule states:

- Create the target TARGET_ELF (variable declared on line 263) from the prerequisites included in TARGET_OBJS. (Ignore the ifeq statement, this is only for FC running an STM32F1 microprocessor - which are no longer supported by Cleanflight).
- The recipe for this rule includes a number of compiler options listed in the LD_FLAGS variable. (See screenshot below).
	
![LD-FLAGS-declaration.png](https://i.postimg.cc/W4tF9RHY/LD-FLAGS-declaration.png)

^*Assignment of LD_FLAGS variable*

## 5. Creating the Final Executable

The final step in the process is to create the final .hex executable. It creates the executable by following the rule in the screenshot below:

![TARGET-HEX-declaration.png](https://i.postimg.cc/1zNRnyTS/TARGET-HEX-declaration.png)

^*This rule explains how to create the .hex executable*

This rule states:

- Create the target TARGET_HEX (variable declared on line 262) from the prerequisites included in TARGET_ELF.

(More specifically, this rule is actually ultimately invoked by the 'hex' rule by using the $(make) command (see screenshot below. But the result is the same: It creates the final executable file that will be flashed onto the microprocessor in the FC).

![hex-rule-declaration.png](https://i.postimg.cc/nrVtkxdC/hex-rule-declaration.png)

^*This rule is what actually invokes TARGET_HEX*
