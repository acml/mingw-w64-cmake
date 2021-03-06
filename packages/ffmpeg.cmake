ExternalProject_Add(ffmpeg
    DEPENDS
        bzip2
        game-music-emu
        gmp
        lame
        libass
        libbluray
        libmodplug
        libpng
        libsoxr
        libvpx
        libzimg
        opus
        speex
        vorbis
        x264
        xvidcore
#     GIT_REPOSITORY "git://source.ffmpeg.org/ffmpeg.git"
    GIT_REPOSITORY "git://github.com/FFmpeg/FFmpeg.git"
    UPDATE_COMMAND ""
    PATCH_COMMAND ${EXEC} git am ${CMAKE_CURRENT_SOURCE_DIR}/ffmpeg-*.patch
    CONFIGURE_COMMAND ${EXEC} <SOURCE_DIR>/configure
    --cross-prefix=${TARGET_ARCH}-
    --prefix=${MINGW_INSTALL_PREFIX}
    --arch=${TARGET_CPU}
    --target-os=mingw32
    --target-exec=wine
    --pkg-config-flags=--static
    --enable-cross-compile
    --enable-runtime-cpudetect
    --enable-gpl
    --enable-version3
    --enable-nonfree
    --enable-avresample
    --enable-postproc
    --enable-avisynth
    --enable-gmp
    --enable-libass
    --enable-libbluray
    --enable-libfreetype
    --enable-libfribidi
    --enable-libgme
    --enable-libmodplug
    --enable-libmp3lame
    --enable-libopus
    --enable-libsoxr
    --enable-libspeex
    --enable-libvorbis
    --enable-libvpx
    --enable-libx264
    --enable-libxvid
    --enable-libzimg
    --enable-schannel
    "--extra-libs='-lsecurity -lschannel'" # ffmpeg’s build system is retarded
    BUILD_COMMAND ${MAKE}
    INSTALL_COMMAND ${MAKE} install
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)

force_rebuild_git(ffmpeg)
