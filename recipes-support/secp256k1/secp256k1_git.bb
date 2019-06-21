# Copyright (C) 2019 Bernardo Rodrigues <bernardoar@protonmail.com>

SUMMARY = "Optimized C library for EC operations on curve secp256k1 "
HOMEPAGE = "https://en.bitcoin.it/wiki/Secp256k1"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = "git://github.com/bitcoin-core/secp256k1.git"
SRCREV = "${AUTOREV}"

S = "${WORKDIR}/git"

inherit autotools
