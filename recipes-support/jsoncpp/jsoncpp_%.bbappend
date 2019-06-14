SRC_URI += " \
	    file://jsoncppConfig.cmake \
	    file://jsoncppConfig-release.cmake \
	   "

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

FILES_${PN} += " \
		/usr/lib/cmake/jsoncpp \
"

do_install_append(){
    install -d ${D}${libdir}/cmake/jsoncpp
    cp ${WORKDIR}/jsoncppConfig.cmake ${D}${libdir}/cmake/jsoncpp
    cp ${WORKDIR}/jsoncppConfig-release.cmake ${D}${libdir}/cmake/jsoncpp
}
