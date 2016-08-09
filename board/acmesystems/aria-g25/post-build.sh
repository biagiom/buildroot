#!/bin/sh

if [ -e ${BINARIES_DIR}/at91sam9x5_aria-sdcardboot-linux-zimage-dt-3.8.5.bin ]; then 
	if [ -e ${BINARIES_DIR}/boot.bin ]; then
		mkdir ${BINARIES_DIR}/aria-at91bootstrap
		mv ${BINARIES_DIR}/*.bin ${BINARIES_DIR}/aria-at91bootstrap
		cp -v ${BINARIES_DIR}/aria-at91bootstrap/at91sam9x5_aria-sdcardboot-linux-zimage-dt-3.8.5.bin ${BINARIES_DIR}/boot.bin
	else
		mv ${BINARIES_DIR}/at91sam9x5_aria-sdcardboot-linux-zimage-dt-3.8.5.bin ${BINARIES_DIR}/boot.bin
	fi
else
	echo "Cannot find the AT91bootstrap image for Aria-G25"
fi

