# Copyright (C) 2019 Bernardo Rodrigues <bernardoar@protonmail.com>
# Released under the GPLv3 license (see LINCENSE for the terms)

SUMMARY = "Aleth – Ethereum C++ client, tools and libraries"
DESCRIPTION = "The collection of C++ libraries and tools for Ethereum, formerly known as cpp-ethereum project. This includes the full Ethereum client aleth."
HOMEPAGE = "http://cpp-ethereum.org/"
LICENSE = "GPLv3"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-3.0;md5=c79ff39f19dfec6d293b95dea7b07891"

SRC_URI = "gitsm://github.com/ethereum/aleth.git;tag=v1.6.0"
S = "${WORKDIR}/git"

EXTRA_OECMAKE += "\
                   -DHUNTER_ENABLED=OFF \
"

inherit cmake

DEPENDS = "boost jsoncpp snappy libcryptopp ethash"
