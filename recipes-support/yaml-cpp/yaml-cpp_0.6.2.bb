DESCRIPTION = "yaml-cpp is a YAML parser and emitter in C++ matching the YAML 1.2 spec"
HOMEPAGE = "https://github.com/jbeder/yaml-cpp/"
SECTION = "libs"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://LICENSE;md5=6a8aaf0595c2efc1a9c2e0913e9c1a2c"

PR = "r0"

S = "${WORKDIR}/git"

SRC_URI = "git://github.com/jbeder/${PN}.git;branch=master;protocol=git"
SRCREV = "562aefc114938e388457e6a531ed7b54d9dc1b62"

SRC_URI += " \
    file://yaml-cppConfig.cmake \
    file://yaml-cppConfigVersion.cmake \
    file://yaml-cppTargets.cmake \
    file://yaml-cppTargets-release.cmake \
"

EXTRA_OECMAKE = "-DBUILD_SHARED_LIBS=ON -DYAML_CPP_BUILD_TESTS=OFF"

inherit cmake

PACKAGES =+ "${PN}-gtest"
FILES_${PN}-gtest += " \
    ${libdir}/libgmock_main.so \
    ${libdir}/libgtest_main.so \
    ${libdir}/libgtest.so \
    ${libdir}/libgmock.so \
"

FILES_${PN} += " \
    /usr/lib/yaml-cpp/cmake \
"

do_install_append(){
    install -d ${D}${libdir}/cmake/yaml-cpp
    cp ${WORKDIR}/yaml-cppConfig.cmake ${D}${libdir}/cmake/yaml-cpp
    cp ${WORKDIR}/yaml-cppConfigVersion.cmake ${D}${libdir}/cmake/yaml-cpp
    cp ${WORKDIR}/yaml-cppTargets.cmake ${D}${libdir}/cmake/yaml-cpp
    cp ${WORKDIR}/yaml-cppTargets-release.cmake ${D}${libdir}/cmake/yaml-cpp
}
