#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "libjson-rpc-cpp::common" for configuration "Release"
set_property(TARGET libjson-rpc-cpp::common APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(libjson-rpc-cpp::common PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libjsonrpccpp-common.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS libjson-rpc-cpp::common )
list(APPEND _IMPORT_CHECK_FILES_FOR_libjson-rpc-cpp::common "${_IMPORT_PREFIX}/lib/libjsonrpccpp-common.a" )

# Import target "libjson-rpc-cpp::client" for configuration "Release"
set_property(TARGET libjson-rpc-cpp::client APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(libjson-rpc-cpp::client PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libjsonrpccpp-client.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS libjson-rpc-cpp::client )
list(APPEND _IMPORT_CHECK_FILES_FOR_libjson-rpc-cpp::client "${_IMPORT_PREFIX}/lib/libjsonrpccpp-client.a" )

# Import target "libjson-rpc-cpp::server" for configuration "Release"
set_property(TARGET libjson-rpc-cpp::server APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(libjson-rpc-cpp::server PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libjsonrpccpp-server.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS libjson-rpc-cpp::server )
list(APPEND _IMPORT_CHECK_FILES_FOR_libjson-rpc-cpp::server "${_IMPORT_PREFIX}/lib/libjsonrpccpp-server.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
