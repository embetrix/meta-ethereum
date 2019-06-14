SRC_URI += " \
	    file://SnappyTargets-release.cmake \
	   "

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

FILES_${PN} += " \
		/usr/lib/cmake/Snappy \
"

do_install_append(){
    install -d ${D}${libdir}/cmake/Snappy
    cp ${WORKDIR}/SnappyTargets-release.cmake ${D}${libdir}/cmake/Snappy
}
