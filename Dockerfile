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

# Remove 'Requires.private' and 'Libs.private' in the glib-2.0.pc
RUN sed -i '/Requires.private: libpcre/d' $EMULATOR_SYSROOT/usr/lib/pkgconfig/glib-2.0.pc \
    && sed -i '/Libs.private: -pthread  -lpcre/d' $EMULATOR_SYSROOT/usr/lib/pkgconfig/glib-2.0.pc \
    && sed -i '/Requires.private: libpcre/d' $DEVICE_SYSROOT/usr/lib/pkgconfig/glib-2.0.pc \
    && sed -i '/Libs.private: -pthread  -lpcre/d' $DEVICE_SYSROOT/usr/lib/pkgconfig/glib-2.0.pc

COPY Toolchain.cmake emulator.env device.env /home/work/
RUN echo alias cmake=\"cmake -DCMAKE_TOOLCHAIN_FILE=/home/work/Toolchain.cmake\" >> ~/.bashrc