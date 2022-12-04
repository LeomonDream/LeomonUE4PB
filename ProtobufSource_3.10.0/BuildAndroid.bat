@echo off

rem Environment setting
set NDK=D:\Android\NDK
set NDK_MAKE=%NDK%\prebuilt\windows-x86_64\bin\make.exe
set NDK_TOOLCHAIN=%NDK%\build\cmake\android.toolchain.cmake

rem Clean old build
rmdir /S /Q lib\Android
mkdir lib\Android
mkdir lib\Android\ARMv7
mkdir lib\Android\ARM64
mkdir lib\Android\x64
mkdir lib\Android\x86

rem ARMv7
mkdir build_temp
cd build_temp
cmake ../source/cmake -G "MinGW Makefiles" -DCMAKE_BUILD_TYPE="Release" -DCMAKE_TOOLCHAIN_FILE=%NDK_TOOLCHAIN% -DTARGET_BUILD_PLATFORM=Android -DANDROID_NDK=%NDK% -DCMAKE_MAKE_PROGRAM=%NDK_MAKE% -DANDROID_STL=gnustl_shared -DANDROID_NATIVE_API_LEVEL="android-19" -DANDROID_ABI="armeabi-v7a"
%NDK_MAKE% libprotobuf
copy libprotobuf.a ..\lib\Android\ARMv7
cd ..
rmdir /S /Q build_temp

rem ARM64
mkdir build_temp
cd build_temp
cmake ../source/cmake -G "MinGW Makefiles" -DCMAKE_BUILD_TYPE="Release" -DCMAKE_TOOLCHAIN_FILE=%NDK_TOOLCHAIN% -DTARGET_BUILD_PLATFORM=Android -DANDROID_NDK=%NDK% -DCMAKE_MAKE_PROGRAM=%NDK_MAKE% -DANDROID_STL=gnustl_shared -DANDROID_NATIVE_API_LEVEL="android-21" -DANDROID_ABI="arm64-v8a"
%NDK_MAKE% libprotobuf
copy libprotobuf.a ..\lib\Android\ARM64
cd ..
rmdir /S /Q build_temp

rem x86
mkdir build_temp
cd build_temp
cmake ../source/cmake -G "MinGW Makefiles" -DCMAKE_BUILD_TYPE="Release" -DCMAKE_TOOLCHAIN_FILE=%NDK_TOOLCHAIN% -DTARGET_BUILD_PLATFORM=Android -DANDROID_NDK=%NDK% -DCMAKE_MAKE_PROGRAM=%NDK_MAKE% -DANDROID_STL=gnustl_shared -DANDROID_NATIVE_API_LEVEL="android-19" -DANDROID_ABI="x86"
%NDK_MAKE% libprotobuf
copy libprotobuf.a ..\lib\Android\x86
cd ..
rmdir /S /Q build_temp

rem x64
mkdir build_temp
cd build_temp
cmake ../source/cmake -G "MinGW Makefiles" -DCMAKE_BUILD_TYPE="Release" -DCMAKE_TOOLCHAIN_FILE=%NDK_TOOLCHAIN% -DTARGET_BUILD_PLATFORM=Android -DANDROID_NDK=%NDK% -DCMAKE_MAKE_PROGRAM=%NDK_MAKE% -DANDROID_STL=gnustl_shared -DANDROID_NATIVE_API_LEVEL="android-21" -DANDROID_ABI="x86_64"
%NDK_MAKE% libprotobuf
copy libprotobuf.a ..\lib\Android\x64
cd ..
rmdir /S /Q build_temp
