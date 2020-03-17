FROM nugulinux/devenv:tizencli

# Cross compile configuration for Emulator
ENV EMULATOR_TOOLCHAIN=/home/work/tizen-studio/tools/i586-linux-gnueabi-gcc-6.2 \
    EMULATOR_SYSROOT=/home/work/tizen-studio/platforms/tizen-4.0/mobile/rootstraps/mobile-4.0-emulator.core \
    EMULATOR_TRIPLE=i586-linux-gnueabi \
    EMULATOR_ARCH=i386 \
    DEVICE_TOOLCHAIN=/home/work/tizen-studio/tools/arm-linux-gnueabi-gcc-6.2 \
    DEVICE_SYSROOT=/home/work/tizen-studio/platforms/tizen-4.0/mobile/rootstraps/mobile-4.0-device.core \
    DEVICE_TRIPLE=arm-linux-gnueabi \
    DEVICE_ARCH=armel

# Workaround to fix permission error for default sysroot in i586-linux-gnueabi-gcc-6.2
#  $ i586-linux-gnueabi-gcc -print-sysroot
#  /root/.dibs/srib-dibs-builder-s32-u64/workspace/jobs/14087/buildRoot/rs-devel_glibc-2.24.i686
RUN sudo chmod 755 /root

# Workaround to fix curl build will recognize the TIZEN ca-cert path
# Copy the ca-certificates.crt to TIZEN ca-cert path with rename(remove ~s)
RUN sudo mkdir -p /opt/share/cert-svc \
    && sudo cp /etc/ssl/certs/ca-certificates.crt /opt/share/cert-svc/ca-certificate.crt

# Remove 'Requires.private' and 'Libs.private' in the glib-2.0.pc
RUN sed -i '/Requires.private: libpcre/d' $EMULATOR_SYSROOT/usr/lib/pkgconfig/glib-2.0.pc \
    && sed -i '/Libs.private: -pthread  -lpcre/d' $EMULATOR_SYSROOT/usr/lib/pkgconfig/glib-2.0.pc \
    && sed -i '/Requires.private: libpcre/d' $DEVICE_SYSROOT/usr/lib/pkgconfig/glib-2.0.pc \
    && sed -i '/Libs.private: -pthread  -lpcre/d' $DEVICE_SYSROOT/usr/lib/pkgconfig/glib-2.0.pc

# Provide environment variable setting files for emulator and device
#   $ source ~/emulator.env
#   $ cmake...
COPY Toolchain.cmake emulator.env device.env /home/work/

# add dependency library
COPY emulator $EMULATOR_SYSROOT/
COPY device $DEVICE_SYSROOT/

RUN echo alias cmake=\"cmake -DCMAKE_TOOLCHAIN_FILE=/home/work/Toolchain.cmake\" >> ~/.bashrc
