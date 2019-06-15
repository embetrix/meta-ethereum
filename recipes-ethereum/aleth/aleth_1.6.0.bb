# Copyright (C) 2019 Bernardo Rodrigues <bernardoar@protonmail.com>

SUMMARY = "Aleth – Ethereum C++ client, tools and libraries"
DESCRIPTION = "The collection of C++ libraries and tools for Ethereum, formerly known as cpp-ethereum project. This includes the full Ethereum client aleth."
HOMEPAGE = "http://cpp-ethereum.org/"
LICENSE = "GPLv3"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-3.0;md5=c79ff39f19dfec6d293b95dea7b07891"

GCCVERSION = "5.2%"

SRC_URI = "\
	   gitsm://github.com/ethereum/aleth.git;tag=v1.6.0 \
	   file://0001-avoid-cmake-config.patch \
	   file://0002-fix-gtest_main.patch \
	   file://BoostConfig.cmake \
	   file://Findjsoncpp.cmake \
	   file://Findcryptopp.cmake \
	   file://FindMHD.cmake \
	   file://Findleveldb.cmake \
	   file://Findsnappy.cmake \
	   file://Findyaml-cpp.cmake \
	  "

S = "${WORKDIR}/git"

BOOST_INCLUDEDIR = "${RECIPE_SYSROOT}/usr/include/boost"
BOOST_LIBRARYDIR = "${RECIPE_SYSROOT}/usr/lib"

EXTRA_OECMAKE += "\
                   -DHUNTER_ENABLED=OFF \
"

inherit cmake

DEPENDS = "boost jsoncpp snappy libcryptopp ethash jsonrpc libmicrohttpd scrypt leveldb rocksdb gtest yaml-cpp crc32c"

OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM = "BOTH"

do_populate_cmake(){
    cp ${WORKDIR}/BoostConfig.cmake ${S}/cmake
    cp ${WORKDIR}/Findcryptopp.cmake ${S}/cmake
    cp ${WORKDIR}/FindMHD.cmake ${S}/cmake
    cp ${WORKDIR}/Findsnappy.cmake ${S}/cmake
    cp ${WORKDIR}/Findleveldb.cmake ${S}/cmake
    cp ${WORKDIR}/Findjsoncpp.cmake ${S}/cmake
}

addtask do_populate_cmake after do_unpack before do_configure
