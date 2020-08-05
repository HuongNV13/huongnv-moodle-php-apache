#!/usr/bin/env bash

set -e

cd /tmp
wget http://downloads.sourceforge.net/project/sbcl/sbcl/1.3.1/sbcl-1.3.1-source.tar.bz2
tar -xf sbcl-1.3.1-source.tar.bz2
cd sbcl-1.3.1/
./make-config.sh
./make.sh
./install.sh

cd /tmp
wget http://kent.dl.sourceforge.net/project/maxima/Maxima-source/5.36.1-source/maxima-5.36.1.tar.gz
tar -zxf maxima-5.36.1.tar.gz
cd maxima-5.36.1/

./configure  --with-sbcl
make
make install
