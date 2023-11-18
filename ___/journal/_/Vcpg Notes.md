# VCPG Notes

Převzato z https://github.com/dtcxzyw/animgui/blob/main/.github/workflows/windows.yml

.\vcpkg\vcpkg.exe install glew:x64-windows
The package glew is compatible with built-in CMake targets:

    find_package(GLEW REQUIRED)
    target_link_libraries(main PRIVATE GLEW::GLEW)


.\vcpkg\vcpkg.exe install glfw3:x64-windows
The package glfw3:x64-windows provides CMake targets:

    find_package(glfw3 CONFIG REQUIRED)
    target_link_libraries(main PRIVATE glfw)


The package directx-headers:x64-windows provides CMake targets:

    find_package(directx-headers CONFIG REQUIRED)
    target_link_libraries(main PRIVATE Microsoft::DirectX-Guids Microsoft::DirectX-Headers)

The package stb:x64-windows is header only and can be used from CMake via:

    find_path(STB_INCLUDE_DIRS "stb.h")
    target_include_directories(main PRIVATE ${STB_INCLUDE_DIRS})

The package utfcpp:x64-windows provides CMake targets:

    find_package(utf8cpp CONFIG REQUIRED)
    target_link_libraries(main PRIVATE utf8cpp)

.\vcpkg\vcpkg.exe integrate install
Applied user-wide integration for this vcpkg root.

All MSBuild C++ projects can now #include any installed libraries.
Linking will be handled automatically.
Installing new libraries will make them instantly available.

CMake projects should use: "-DCMAKE_TOOLCHAIN_FILE=C:/Users/dlanda/Projects/vcpkg/scripts/buildsystems/vcpkg.cmake"



PS C:\Users\dlanda\Projects\Personal\animgui> cmake --build build
Microsoft (R) Build Engine version 16.11.2+f32259642 for .NET Framework
Copyright (C) Microsoft Corporation. All rights reserved.

  Checking Build System
  Building Custom Rule C:/Users/dlanda/Projects/Personal/animgui/src/CMakeLists.txt
cl : command line error D8016: '/O2' and '/RTC1' command-line options are incompatible [C:\Users\dlanda\Projects\Personal\animgui\build\src\animgui.vcxproj]

MUSIME kompilovat jako release!

