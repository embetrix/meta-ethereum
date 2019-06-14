CXXFLAGS += "-Wno-error=deprecated-copy -Wno-error=pessimizing-move"

SRC_URI += "file://RocksDBTargets-release.cmake"

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

FILES_${PN} += " \
		/usr/lib/cmake/rocksdb \
"

do_install_append(){
    install -d ${D}${libdir}/cmake/rocksdb
    cp ${WORKDIR}/RocksDBTargets-release.cmake ${D}${libdir}/cmake/rocksdb
}

