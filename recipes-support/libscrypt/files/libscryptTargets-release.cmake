#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "libscrypt::scrypt" for configuration "Release"
set_property(TARGET libscrypt::scrypt APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(libscrypt::scrypt PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "C"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libscrypt.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS libscrypt::scrypt )
list(APPEND _IMPORT_CHECK_FILES_FOR_libscrypt::scrypt "${_IMPORT_PREFIX}/lib/libscrypt.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
