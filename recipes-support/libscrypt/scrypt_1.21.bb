# Copyright (C) 2019 Bernardo Rodrigues <bernardoar@protonmail.com>

SUMMARY = "Linux scrypt shared library."
DESCRIPTION = "A shared library that implements scrypt() functionality - a replacement for bcrypt() "
HOMEPAGE = "http://www.lolware.net/libscrypt.html"
LICENSE = "BSD-2-Clause"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-2-Clause;md5=8bef8e6712b1be5aa76af1ebde9d6378"

SRC_URI = "\
	   git://github.com/technion/libscrypt;tag=v1.21 \
	   file://libscryptTargets.cmake \
	   file://libscryptConfig.cmake \
	   file://libscryptTargets-release.cmake \
	  "
S = "${WORKDIR}/git"

FILES_${PN} = " \
		/usr/include \
		/usr/lib \
		/usr/lib/libscrypt/cmake \
"

CFLAGS_append = "-fPIC"

do_install(){
    install -d ${D}${libdir}
    cp ${S}/libscrypt.a ${D}${libdir}

    install -d ${D}${includedir}
    cp ${S}/libscrypt.h ${D}${includedir}

    install -d ${D}${libdir}/libscrypt/cmake
    cp ${WORKDIR}/libscryptTargets.cmake ${D}${libdir}/libscrypt/cmake
    cp ${WORKDIR}/libscryptConfig.cmake ${D}${libdir}/libscrypt/cmake
    cp ${WORKDIR}/libscryptTargets-release.cmake ${D}${libdir}/libscrypt/cmake
}
