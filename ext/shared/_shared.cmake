# sourcepp
set(SOURCEPP_LIBS_START_ENABLED OFF CACHE INTERNAL "" FORCE)
set(SOURCEPP_USE_BSPPP          ON  CACHE INTERNAL "" FORCE)
set(SOURCEPP_USE_DMXPP          ON  CACHE INTERNAL "" FORCE)
set(SOURCEPP_USE_KVPP           ON  CACHE INTERNAL "" FORCE)
set(SOURCEPP_USE_MDLPP          ON  CACHE INTERNAL "" FORCE)
set(SOURCEPP_USE_STEAMPP        ON  CACHE INTERNAL "" FORCE)
set(SOURCEPP_USE_VCRYPTPP       ON  CACHE INTERNAL "" FORCE)
set(SOURCEPP_USE_VPKPP          ON  CACHE INTERNAL "" FORCE)
set(SOURCEPP_USE_VTFPP          ON  CACHE INTERNAL "" FORCE)
# Pre-declare bcdec via archive URL because the upstream commit 59441e17ba36b7d7eef336aeedc62e01d0cdcd5a
# is dangling on GitHub (not attached to any branch/tag), causing `git clone` to fail in CMake.
include(FetchContent)
FetchContent_Declare(
	bcdec
	URL "https://github.com/craftablescience/bcdec/archive/59441e17ba36b7d7eef336aeedc62e01d0cdcd5a.zip"
	DOWNLOAD_EXTRACT_TIMESTAMP TRUE
)
FetchContent_Declare(
	minizip-ng
	URL "https://github.com/craftablescience/minizip-ng/archive/de1f8bba0b7dbd0920289768edad8d878c95421f.zip"
	DOWNLOAD_EXTRACT_TIMESTAMP TRUE
)
# Fix for libtommath unresolved external symbols (s_read_getrandom, s_read_arc4random, s_read_urandom) in MSVC Debug builds
FetchContent_Declare(
	libtommath
	URL "https://github.com/craftablescience/libtommath/archive/d0c643ffb76db2ff7592e8f0834f671d25cf8159.zip"
	DOWNLOAD_EXTRACT_TIMESTAMP TRUE
	OVERRIDE_FIND_PACKAGE
	EXCLUDE_FROM_ALL
)

add_subdirectory("${CMAKE_CURRENT_LIST_DIR}/sourcepp")

