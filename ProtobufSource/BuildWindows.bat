@echo off

rem Environment setting
set VC="D:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars64.bat"

rem Clean old build
rmdir /S /Q lib\Windows
rmdir /S /Q bin
mkdir lib\Windows
mkdir bin

rem Build
mkdir build_temp
cd build_temp
call %VC%
cmake ../source/cmake -G "NMake Makefiles" -DCMAKE_BUILD_TYPE="Release" -DCMAKE_INSTALL_PREFIX=../ -DBUILD_SHARED_LIBS=OFF -Dprotobuf_BUILD_TESTS=OFF -Dprotobuf_BUILD_CONFORMANCE=OFF -Dprotobuf_BUILD_EXAMPLES=OFF -Dprotobuf_BUILD_PROTOC_BINARIES=ON -Dprotobuf_MSVC_STATIC_RUNTIME=OFF
nmake -nologo install
cd ..
rmdir /S /Q cmake
rmdir /S /Q lib\pkbconfig
rmdir /S /Q build_temp
move lib\libprotobuf.lib lib\Windows
del /F /Q libprotobuf-lite.lib libprotoc.lib 