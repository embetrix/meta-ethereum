# - Try to find libsnappy
# Once done, this will define
#
#  snappy_FOUND - system has snappy
#  snappy_INCLUDE_DIRS - the snappy include directories
#  snappy_LIBRARIES - link these to use snappy

include(LibFindMacros)

set(_snappy_hints
    ${SNAPPY_ROOT}/include
    ${SNAPPY_ROOT}/lib
    $ENV{HOME}/usr/include
    $ENV{HOME}/usr/lib
    /usr/local/include
    /usr/local/lib
    /usr/include
    /usr/lib
)

# Include dir
find_path(snappy_INCLUDE_DIR
  NAMES snappy.h
  HINTS ${_snappy_hints}
)

# Finally the library itself
find_library(snappy_LIBRARY
  NAMES snappy
  HINTS ${_snappy_hints}
)

# Set the include dir variables and the libraries and let libfind_process do the rest.
# NOTE: Singular variables for this library, plural for libraries this this lib depends on.
set(snappy_PROCESS_INCLUDES snappy_INCLUDE_DIR)
set(snappy_PROCESS_LIBS snappy_LIBRARY)
libfind_process(snappy)

