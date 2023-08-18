#!/bin/bash

set -ex

_bin_programs=(
"htdestroytoken"
"htgettoken"
"htdecodetoken"
"httokensh"
)

# install the scripts
_BINDIR="${PREFIX}/bin"
mkdir -p ${_BINDIR}
for _prog in ${_bin_programs[@]}; do
	# fix the sheband for Python
	sed -i.tmp 's|#!/usr/bin/env python|#!/opt/anaconda1anaconda2anaconda3/bin/python|' "${_prog}"
	# install the script
	install -v -m 0755 "${_prog}" "${_BINDIR}/"
done

# install the man pages
_MAN1DIR="${PREFIX}/share/man/man1"
mkdir -p ${_MAN1DIR}
for _manpage in ht*.1; do
	install -v -m 0644 "${_manpage}" "${_MAN1DIR}/"
done
