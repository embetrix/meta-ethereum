# Copyright (C) 2019 Bernardo Rodrigues <bernardoar@protonmail.com>

SUMMARY = "Official Go implementation of the Ethereum protocol"
DESCRIPTION = "geth is the the command line interface for running a full ethereum node implemented in Go."
HOMEPAGE = "https://geth.ethereum.org"
LICENSE = "LGPLv3"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-3.0;md5=bfccfe952269fff2b407dd11f2f3083b"

SRC_URI = "git://github.com/ethereum/go-ethereum.git;tag=v1.8.27"

inherit go
GO_IMPORT = "github.com/ethereum/go-ethereum"
