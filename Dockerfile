FROM ubuntu:bionic
LABEL maintainer="webispy@gmail.com" \
      version="0.1" \
      description="NUGUSDK for Tizen development environment"

ENV DEBIAN_FRONTEND=noninteractive \
    USER=work \
    LC_ALL=en_US.UTF-8 \
    LANG=$LC_ALL

RUN apt-get update && apt-get install -y \
        ca-certificates-java \
        openjdk-8-jdk \
        pciutils \
        rpm2cpio \
        sudo \
        wget \
        zip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# User
RUN useradd -ms /bin/bash $USER \
	&& echo "$USER ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$USER \
	&& chmod 0440 /etc/sudoers.d/$USER \
	&& echo 'Defaults env_keep="http_proxy https_proxy ftp_proxy no_proxy"' >> /etc/sudoers \
	&& adduser $USER dialout

USER $USER
ENV HOME=/home/$USER \
    JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/
ENV PATH=$JAVA_HOME/bin:$PATH
WORKDIR /home/$USER

# Tizen Studio CLI tool
RUN wget http://download.tizen.org/sdk/Installer/tizen-studio_4.0/web-cli_Tizen_Studio_4.0_ubuntu-64.bin \
    && chmod 755 web-cli_Tizen_Studio_4.0_ubuntu-64.bin \
    && yes | ./web-cli_Tizen_Studio_4.0_ubuntu-64.bin --accept-license \
    && rm web-cli_Tizen_Studio_4.0_ubuntu-64.bin

# Add tizen cli path
ENV PATH=/home/$USER/tizen-studio/tools/ide/bin:$PATH

ENTRYPOINT [ "/bin/bash" ]