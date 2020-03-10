FROM nugulinux/devenv:tizenbase

RUN ./tizen-studio/package-manager/package-manager-cli.bin \
    install --accept-license MOBILE-4.0-NativeAppDevelopment-CLI

