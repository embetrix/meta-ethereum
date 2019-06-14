SRC_URI += " \
	    file://GTestTargets-release.cmake \
	   "

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

FILES_${PN} += " \
		/usr/lib/cmake/GTest \
"

do_install_append(){
    install -d ${D}${libdir}/cmake/GTest
    cp ${WORKDIR}/GTestTargets-release.cmake ${D}${libdir}/cmake/GTest
}
