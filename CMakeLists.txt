cmake_minimum_required(VERSION 3.6.2)

project(pts-tiny-7z-sfx)

set(CMAKE_C_STANDARD 99)

add_compile_options(-Werror)

add_compile_options("$<$<CONFIG:Release>:-O2>")

add_executable(tiny7zx.sfx all.c)
