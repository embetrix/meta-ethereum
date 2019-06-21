# Copyright (C) 2019 Bernardo Rodrigues <bernardoar@protonmail.com>

SUMMARY = "C++ library for Finite Fields and Elliptic Curves "
HOMEPAGE = "http://www.scipr-lab.org/"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = "gitsm://github.com/scipr-lab/libff.git"
SRCREV = "${AUTOREV}"

S = "${WORKDIR}/git"

DEPENDS = "procps"

inherit cmake
