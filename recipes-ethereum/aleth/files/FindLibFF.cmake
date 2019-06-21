# Find libff
#
# Find the libff includes and library
# 
# if you need to add a custom library search path, do it via via CMAKE_PREFIX_PATH 
# 
# This module defines
#  libff_INCLUDE_DIRS, where to find header, etc.
#  libff_LIBRARIES, the libraries needed to use libff.
#  libff_FOUND, If false, do not try to use libff.

# only look in default directories
find_path(
	libff_INCLUDE_DIR 
	NAMES libff/common/utils.hpp
	DOC "libff include dir"
)

if(libff_USE_STATIC_LIBS)
	set(names ${CMAKE_STATIC_LIBRARY_PREFIX}libff${CMAKE_STATIC_LIBRARY_SUFFIX})
else()
	set(names libff)
endif()

find_library(
	libff_LIBRARY
	NAMES ${names}
	DOC "libff library"
)

set(libff_INCLUDE_DIRS ${libff_INCLUDE_DIR})
set(libff_LIBRARIES ${libff_LIBRARY})


# handle the QUIETLY and REQUIRED arguments and set libff_FOUND to TRUE
# if all listed variables are TRUE, hide their existence from configuration view
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(libff DEFAULT_MSG
	libff_LIBRARY libff_INCLUDE_DIR)
mark_as_advanced (libff_INCLUDE_DIR libff_LIBRARY)

include("${CMAKE_CURRENT_LIST_DIR}/LibFFTargets.cmake")
