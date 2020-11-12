FROM nugulinux/devenv:tizenbase

RUN sudo apt update && sudo apt install -y \
      python2.7 \
      libpython2.7 \
    && sudo apt-get clean \
    && sudo rm -rf /var/lib/apt/lists/* \
    && ./tizen-studio/package-manager/package-manager-cli.bin \
    install --accept-license MOBILE-4.0-NativeAppDevelopment-CLI
