function update-aseprite
    mkdir -p ~/deps
    cd ~/deps || exit
    git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
    git clone -b aseprite-m102 https://github.com/aseprite/skia.git
    cd depot_tools || exit
    git pull
    cd ../depot_tools || exit
    git pull
    cd .. || exit
    set -gx PATH $PWD/depot_tools $PATH
    cd skia || exit
    python tools/git-sync-deps
    gn gen out/Release --args="is_debug=false is_official_build=true skia_use_system_expat=false skia_use_system_icu=false skia_use_system_libjpeg_turbo=false skia_use_system_libpng=false skia_use_system_libwebp=false skia_use_system_zlib=false"
    ninja -C out/Release skia
    ls -s out/Release out/Release-x64

    cd ~/Coding/aseprite || exit
    git pull
    git submodule update --init --recursive
    mkdir build
    cd build || exit
    export CC=clang
    export CXX=clang++
    cmake \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DLAF_OS_BACKEND=skia \
        -DSKIA_DIR=~/deps/skia \
        -DSKIA_OUT_DIR=~/deps/skia/out/Release \
        -G Ninja \
        ..
    ninja aseprite
end
