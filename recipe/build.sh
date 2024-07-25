#!/bin/bash

set -ex

# install the Python package
$PYTHON -m pip install . --no-deps --ignore-installed

# install the man pages
_MAN1DIR="${PREFIX}/share/man/man1"
mkdir -p ${_MAN1DIR}
for _manpage in ht*.1; do
  install -v -m 0644 "${_manpage}" "${_MAN1DIR}/"
done
