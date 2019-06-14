# Copyright (C) 2019 Bernardo Rodrigues <bernardoar@protonmail.com>

SUMMARY = ""
DESCRIPTION = ""
HOMEPAGE = ""
LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-2-Clause;md5=8bef8e6712b1be5aa76af1ebde9d6378"

SRC_URI = "\
	   gitsm://github.com/google/crc32c.git;tag=1.0.7 \
	   file://Crc32cTargets-release.cmake \
	  "
S = "${WORKDIR}/git"

EXTRA_OECMAKE = " \
		-DBENCHMARK_ENABLE_GTEST_TESTS=OFF \
		-DCRC32C_BUILD_TESTS=0 \
		-DCRC32C_BUILD_BENCHMARKS=0 \
		"

inherit cmake

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

FILES_${PN} += " \
		/usr/lib/cmake/Crc32c \
"

do_install_append(){
    install -d ${D}${libdir}/cmake/Crc32c
    cp ${WORKDIR}/Crc32cTargets-release.cmake ${D}${libdir}/cmake/Crc32c
}

