# NUGU SDK for tizen development environment

## Build test

Download preconfigured docker image

    docker pull nugulinux/devenv:tizencli

Run

    docker run -it --rm nugulinux/devenv:tizencli
    work@3bc6c74c10bc:~$
    
Create sample native project

    $ tizen create native-project -p mobile-4.0 -t ServiceApp -n servicetest -- ~/workspace/

Build the project

    $ tizen build-native -a x86 -c gcc -C Debug -- ~/workspace/servicetest

Buiild result

    $ ls -l ~/workspace/servicetest/Debug/
    total 52
    -rw-r--r-- 1 work work   188 Mar 10 06:33 build.info
    drwxr-xr-x 2 work work  4096 Mar 10 06:33 objs
    -rwxr-xr-x 1 work work 41184 Mar 10 06:33 servicetest
