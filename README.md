# NUGU SDK for tizen development environment

- [Docker images for tizen build](#docker-images-for-tizen-build)
  - [nugulinux/devenv:tizenbase](#nugulinuxdevenvtizenbase)
  - [nugulinux/devenv:tizencli](#nugulinuxdevenvtizencli)
  - [nugulinux/devenv:tizen](#nugulinuxdevenvtizen)
- [Build with CMake](#build-with-cmake)
  - [Prepare tizen docker](#prepare-tizen-docker)
  - [Select build target](#select-build-target)
  - [Build using CMake](#build-using-cmake)
- [Build with Tizen native-project template](#build-with-tizen-native-project-template)
  - [Prepare tizencli docker](#prepare-tizencli-docker)
  - [Create a sample native project](#create-a-sample-native-project)
  - [Build the project](#build-the-project)
  - [Build result](#build-result)

## Docker images for tizen build

### nugulinux/devenv:tizenbase

[![Build Status](https://github.com/nugulinux/docker-devenv-tizen/workflows/Docker%20publish%20-%20tizenbase/badge.svg)](https://github.com/nugulinux/docker-devenv-tizen/actions?query=workflow%3A%22Docker+publish+-+tizenbase%22)

    docker pull nugulinux/devenv:tizenbase

- Branch: [base](https://github.com/nugulinux/docker-devenv-tizen/tree/base)
- Inherited nugulinux/devenv:bionic
- Installed files
  - web-cli_Tizen_Studio_3.6_ubuntu-64.bin

### nugulinux/devenv:tizencli

[![Build Status](https://github.com/nugulinux/docker-devenv-tizen/workflows/Docker%20publish%20-%20tizencli/badge.svg)](https://github.com/nugulinux/docker-devenv-tizen/actions?query=workflow%3A%22Docker+publish+-+tizencli%22)

    docker pull nugulinux/devenv:tizencli

- Branch: [cli](https://github.com/nugulinux/docker-devenv-tizen/tree/cli)
- Inherited nugulinux/devenv:tizenbase
- Installed files
  - MOBILE-4.0-NativeAppDevelopment-CLI using package-manager

### nugulinux/devenv:tizen

[![Build Status](https://github.com/nugulinux/docker-devenv-tizen/workflows/Docker%20publish%20-%20tizen/badge.svg)](https://github.com/nugulinux/docker-devenv-tizen/actions?query=workflow%3A%22Docker+publish+-+tizen%22)

    docker pull nugulinux/devenv:tizen

- Branch: [tizen](https://github.com/nugulinux/docker-devenv-tizen/tree/tizen)
- Inherited nugulinux/devenv:tizencli
- Installed files
  - CMake workaround patches
  - Emulator cross-compile settings

## Build with CMake

### Prepare tizen docker

Download the pre-configured docker image

    docker pull nugulinux/devenv:tizen

Create and run a container

    docker run -it --rm nugulinux/devenv:tizen
    work@3bc6c74c10bc:~$

### Select build target

For emulator:

    source ~/emulator.env

For device:

    source ~/device.env

### Build using CMake

    cd myproject
    mkdir build && cd build
    cmake .. -DCMAKE_TOOLCHAIN_FILE=~/Toolchain.cmake
    make

## Build with Tizen native-project template

### Prepare tizencli docker

Download the pre-configured docker image

    docker pull nugulinux/devenv:tizencli

Create and run a container

    $ docker run -it --rm nugulinux/devenv:tizencli
    work@3bc6c74c10bc:~$

### Create a sample native project

    $ tizen create native-project -p mobile-4.0 -t ServiceApp -n servicetest -- ~/workspace/
    Project Location: /home/work/workspace/servicetest

### Build the project

x86 emulator

    tizen build-native -a x86 -c gcc -C Debug -- ~/workspace/servicetest

```sh
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

    tizen build-native -a arm -c gcc -C Debug -- ~/workspace/servicetest

```sh
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
