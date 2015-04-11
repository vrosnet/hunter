# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_LIBCXX_HUNTER_CMAKE_)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_LIBCXX_HUNTER_CMAKE_ 1)
endif()

include(hunter_add_version)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    Libcxx
    VERSION
    "3.5.0"
    URL
    "http://llvm.org/releases/3.5.0/libcxx-3.5.0.src.tar.xz"
    SHA1
    c98beed86ae1adf9ab7132aeae8fd3b0893ea995
)

hunter_pick_scheme(
    DEFAULT url_sha1_release_debug
    COMBINED url_sha1_combined_release_debug
)

# http://libcxx.llvm.org/
# TODO: Enable only for Release (non Debug?)
# https://github.com/ruslo/hunter/issues/35
hunter_cmake_args(Libcxx CMAKE_ARGS LIBCXX_ENABLE_ASSERTIONS=OFF)

hunter_download(PACKAGE_NAME Libcxx)