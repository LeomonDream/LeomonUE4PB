#!/bin/sh
rm -f lib/IOS/*.a

mkdir -p build_temp
cd build_temp
/Applications/CMake.app/Contents/bin/cmake -DCMAKE_TOOLCHAIN_FILE=../ios.toolchain.cmake -DPLATFORM=OS64COMBINED -DBUILD_SHARED_LIBS=OFF -Dprotobuf_BUILD_TESTS=OFF -Dprotobuf_BUILD_CONFORMANCE=OFF -Dprotobuf_BUILD_EXAMPLES=OFF -Dprotobuf_BUILD_PROTOC_BINARIES=OFF -Dprotobuf_MSVC_STATIC_RUNTIME=OFF -G Xcode ../source/cmake
cd ..
/Applications/CMake.app/Contents/bin/cmake --build build_temp --config Release
cp build_temp/Release-iphoneos/libprotobuf.a lib/IOS/libprotobuf.a
rm -rf build_temp