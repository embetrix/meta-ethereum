SRC_URI += " \
	    file://leveldbConfig.cmake \
	    file://leveldbConfigVersion.cmake \
	    file://leveldbTargets.cmake \
	    file://leveldbTargets-release.cmake \
	   "

FILESEXTRAPATHS_prepend := "${THISDIR}/leveldb:"

FILES_${PN} += " \
		/usr/lib/leveldb/cmake \
"

do_install_append(){
    install -d ${D}${libdir}/leveldb/cmake
    cp ${WORKDIR}/leveldbConfig.cmake ${D}${libdir}/leveldb/cmake
    cp ${WORKDIR}/leveldbConfigVersion.cmake ${D}${libdir}/leveldb/cmake
    cp ${WORKDIR}/leveldbTargets.cmake ${D}${libdir}/leveldb/cmake
    cp ${WORKDIR}/leveldbTargets-release.cmake ${D}${libdir}/leveldb/cmake
}
