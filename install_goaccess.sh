#!/bin/bash
echo ""

# check https://www.goaccess.io for the latest version
version="1.2"

# install requirements
apt-get install libgeoip-dev

# download goaccess and unzip
cd /usr/src/
wget http://tar.goaccess.io/goaccess-${version}.tar.gz
tar -xzvf goaccess-${version}.tar.gz

# install goaccess
cd /usr/src/goaccess-${version}
./configure --enable-utf8 --enable-geoip=legacy --with-openssl && make && make install

# create symlink
ln -s /usr/local/bin/goaccess /usr/bin/goaccess

echo ""
echo "GoAccess ${version} is now installed"
exit
