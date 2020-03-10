# NUGU SDK for tizen development environment

## Build test with native-project template

### Prepare container

Download the pre-configured docker image

    docker pull nugulinux/devenv:tizencli

Create and run a container

    docker run -it --rm nugulinux/devenv:tizencli
    work@3bc6c74c10bc:~$
    
### Create a sample native project

    $ tizen create native-project -p mobile-4.0 -t ServiceApp -n servicetest -- ~/workspace/
    Project Location: /home/work/workspace/servicetest

### Build the project

x86 emulator

    $ tizen build-native -a x86 -c gcc -C Debug -- ~/workspace/servicetest
```
[PLATFORM] Mobile-4.0
[ARCHITECTURE] i386
[COMPILER] gcc-6.2
[CONFIGURATION] Debug
[SBI] prdefine options =
[SBI] command : /bin/sh -c /usr/bin/make -f "/home/work/workspace/servicetest/Build/makefile" -r
/usr/bin/make -f /home/work/workspace/servicetest/Build/makefile.mk
make[1]: Entering directory '/home/work/workspace/servicetest'
preparing to build src/servicetest.c
  Building file: src/servicetest.c
  Invoking: C Compiler
"/home/work/tizen-studio/tools/smart-build-interface/../i586-linux-gnueabi-gcc-6.2/bin/i586-linux-gnueabi-gcc" -c "src/servicetest.c" -o "Debug/objs/servicetest-3194677813.o" -DTIZEN_DEPRECATION -DDEPRECATION_WARNING    -Iinc  -I"pch" -g3 -D_DEBUG -O0 -Wall -c -fmessage-length=0   -fPIE --sysroot="/home/work/tizen-studio/tools/smart-build-interface/../../platforms/tizen-4.0/mobile/rootstraps/mobile-4.0-emulator.core" -Werror-implicit-function-declaration   -Wp,@./Debug/objs/platform_incs_file.inc
  Finished building: src/servicetest.c
  Building target: Debug/servicetest
  Invoking: C/C++ Linker
"/home/work/tizen-studio/tools/smart-build-interface/../i586-linux-gnueabi-gcc-6.2/bin/i586-linux-gnueabi-g++" -o ./Debug/servicetest @./Debug/objs/target_objs.file    -L"/home/work/workspace/servicetest/lib" -Wl,--no-undefined  -Xlinker --as-needed  -Xlinker --as-needed -pie -lpthread --sysroot="/home/work/tizen-studio/tools/smart-build-interface/../../platforms/tizen-4.0/mobile/rootstraps/mobile-4.0-emulator.core" -Xlinker --version-script="./.exportMap" -L/home/work/tizen-studio/platforms/tizen-4.0/mobile/rootstraps/mobile-4.0-emulator.core/usr/lib @./Debug/objs/platform_libs.file -Xlinker -rpath='$ORIGIN/../lib' -Werror-implicit-function-declaration
  Finished building target: Debug/servicetest
========= done =========
make[1]: Leaving directory '/home/work/workspace/servicetest'
Output path : /home/work/workspace/servicetest/Debug (binary:servicetest)
Total time: 00:00:00.449
```

arm

    $ tizen build-native -a arm -c gcc -C Debug -- ~/workspace/servicetest
```
[PLATFORM] Mobile-4.0
[ARCHITECTURE] armel
[COMPILER] gcc-6.2
[CONFIGURATION] Debug
[SBI] prdefine options =
[SBI] command : /bin/sh -c /usr/bin/make -f "/home/work/workspace/servicetest/Build/makefile" -r
/usr/bin/make -f /home/work/workspace/servicetest/Build/makefile.mk
make[1]: Entering directory '/home/work/workspace/servicetest'
preparing to build src/servicetest.c
  Building file: src/servicetest.c
  Invoking: C Compiler
"/home/work/tizen-studio/tools/smart-build-interface/../arm-linux-gnueabi-gcc-6.2/bin/arm-linux-gnueabi-gcc" -c "src/servicetest.c" -o "Debug/objs/servicetest-3194677813.o" -DTIZEN_DEPRECATION -DDEPRECATION_WARNING    -Iinc  -I"pch" -g3 -D_DEBUG -O0 -Wall -c -fmessage-length=0   -fPIE --sysroot="/home/work/tizen-studio/tools/smart-build-interface/../../platforms/tizen-4.0/mobile/rootstraps/mobile-4.0-device.core" -Werror-implicit-function-declaration   -Wp,@./Debug/objs/platform_incs_file.inc
  Finished building: src/servicetest.c
  Building target: Debug/servicetest
  Invoking: C/C++ Linker
"/home/work/tizen-studio/tools/smart-build-interface/../arm-linux-gnueabi-gcc-6.2/bin/arm-linux-gnueabi-g++" -o ./Debug/servicetest @./Debug/objs/target_objs.file    -L"/home/work/workspace/servicetest/lib" -Wl,--no-undefined  -Xlinker --as-needed  -Xlinker --as-needed -pie -lpthread --sysroot="/home/work/tizen-studio/tools/smart-build-interface/../../platforms/tizen-4.0/mobile/rootstraps/mobile-4.0-device.core" -Xlinker --version-script="./.exportMap" -L/home/work/tizen-studio/platforms/tizen-4.0/mobile/rootstraps/mobile-4.0-device.core/usr/lib @./Debug/objs/platform_libs.file -Xlinker -rpath='$ORIGIN/../lib' -Werror-implicit-function-declaration
  Finished building target: Debug/servicetest
========= done =========
make[1]: Leaving directory '/home/work/workspace/servicetest'
Output path : /home/work/workspace/servicetest/Debug (binary:servicetest)
Total time: 00:00:00.461
```

### Build result

    $ ls -l ~/workspace/servicetest/Debug/
    total 52
    -rw-r--r-- 1 work work   188 Mar 10 06:33 build.info
    drwxr-xr-x 2 work work  4096 Mar 10 06:33 objs
    -rwxr-xr-x 1 work work 41184 Mar 10 06:33 servicetest
