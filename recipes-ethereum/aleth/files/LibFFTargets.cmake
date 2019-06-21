#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "libff::ff" for configuration "Release"
set_property(TARGET libff::ff APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(libff::ff PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  INTERFACE_INCLUDE_DIRECTORIES "${CMAKE_SYSROOT}/usr/include"
  IMPORTED_LOCATION_RELEASE "${CMAKE_SYSROOT}/usr/lib/libff.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS libff::ff )
list(APPEND _IMPORT_CHECK_FILES_FOR_libff::ff "${CMAKE_SYSROOT}/usr/lib/libff.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
