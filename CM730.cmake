SET(CMAKE_SYSTEM_NAME Generic)
SET(CMAKE_SYSTEM_PROCESSOR arm)

SET(CROSS_COMPILE "arm-none-eabi-")

IF(CMAKE_VERSION VERSION_LESS 3.6)
    INCLUDE(CMakeForceCompiler)
    CMAKE_FORCE_C_COMPILER("${CROSS_COMPILE}gcc" GNU)
    CMAKE_FORCE_CXX_COMPILER("${CROSS_COMPILE}g++" GNU)
ELSE()
    # Use add_library() with the STATIC option to name the source file in the generated project.
    # This avoids running the linker and is intended for use with cross-compiling toolchains that
    # cannot link without custom flags or linker scripts.
    SET(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)
    SET(CMAKE_C_COMPILER   "${CROSS_COMPILE}gcc")
    SET(CMAKE_CXX_COMPILER "${CROSS_COMPILE}g++")
ENDIF()

SET(CMAKE_AR           "${CROSS_COMPILE}ar" CACHE STRING "" FORCE)
SET(CMAKE_ASM_COMPILER "${CROSS_COMPILE}gcc" CACHE STRING "" FORCE)
SET(CMAKE_OBJCOPY      "${CROSS_COMPILE}objcopy" CACHE STRING "" FORCE)
SET(CMAKE_OBJDUMP      "${CROSS_COMPILE}objdump" CACHE STRING "" FORCE)
SET(CMAKE_RANLIB       "${CROSS_COMPILE}ranlib" CACHE STRING "" FORCE)

SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
