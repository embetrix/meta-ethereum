SRC_URI += " \
	    file://libjson-rpc-cppTargets-release.cmake \
	    file://libjson-rpc-cppConfig.cmake \
	   "

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

FILES_${PN} += " \
		/usr/lib/libjson-rpc-cpp/cmake \
"

do_install_append(){
    install -d ${D}${libdir}/libjson-rpc-cpp/cmake
    cp ${WORKDIR}/libjson-rpc-cppTargets-release.cmake ${D}${libdir}/libjson-rpc-cpp/cmake
    cp ${WORKDIR}/libjson-rpc-cppConfig.cmake ${D}${libdir}/libjson-rpc-cpp/cmake
}
