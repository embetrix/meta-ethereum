#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "Crc32c::crc32c" for configuration "Release"
set_property(TARGET RocksDB::rocksdb APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(RocksDB::rocksdb PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/librocksdb.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS Crc32c::crc32c )
list(APPEND _IMPORT_CHECK_FILES_FOR_Crc32c::crc32c "${_IMPORT_PREFIX}/lib/librocksdb.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
