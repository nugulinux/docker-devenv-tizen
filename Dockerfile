FROM nugulinux/devenv:tizencli

# Cross compile configuration for Emulator
ENV CROSS_TRIPLE=i586-linux-gnueabi \
    CROSS_ROOT=/home/work/tizen-studio/tools/i586-linux-gnueabi-gcc-6.2 \
    CROSS_SYSROOT=/home/work/tizen-studio/platforms/tizen-4.0/mobile/rootstraps/mobile-4.0-emulator.core \
    ARCH=i386

ENV PATH=$CROSS_ROOT/bin:$PATH

ENV AS=${CROSS_TRIPLE}-as \
    AR=${CROSS_TRIPLE}-ar \
    CC=${CROSS_TRIPLE}-gcc \
    CPP=${CROSS_TRIPLE}-cpp \
    CXX=${CROSS_TRIPLE}-g++ \
    LD=${CROSS_TRIPLE}-ld \
    STRIP=${CROSS_TRIPLE}-strip \
    RANLIB=${CROSS_TRIPLE}-ranlib \
    CROSS_COMPILE=${CROSS_TRIPLE}- \
    PKG_CONFIG_LIBDIR=${CROSS_SYSROOT}/usr/lib/pkgconfig \
    PKG_CONFIG_SYSROOT_DIR=${CROSS_SYSROOT}

# Workaround to fix permission error for default sysroot in i586-linux-gnueabi-gcc-6.2
#  $ i586-linux-gnueabi-gcc -print-sysroot
#  /root/.dibs/srib-dibs-builder-s32-u64/workspace/jobs/14087/buildRoot/rs-devel_glibc-2.24.i686
RUN sudo chmod 755 /root

# Remove 'Requires.private' and 'Libs.private' in the glib-2.0.pc
RUN sed -i '/Requires.private: libpcre/d' $CROSS_SYSROOT/usr/lib/pkgconfig/glib-2.0.pc \
    && sed -i '/Libs.private: -pthread  -lpcre/d' $CROSS_SYSROOT/usr/lib/pkgconfig/glib-2.0.pc

COPY Toolchain.cmake /home/work/
RUN echo alias cmake=\"cmake -DCMAKE_TOOLCHAIN_FILE=/home/work/Toolchain.cmake\" >> ~/.bashrc
