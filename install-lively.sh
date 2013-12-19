#!/usr/bin/env bash

cd /vagrant/
if [ -d LivelyKernel ]; then rm -rf LivelyKernel; fi
git clone -b vwf-compat https://github.com/LivelyKernel/LivelyKernel
cd /vagrant/LivelyKernel
ln -fs $PWD $HOME/LivelyKernel
npm install

# setup localconfig, required for vwf right now
conf=$PWD/core/lively/localconfig.js
touch $conf
curl https://gist.github.com/rksm/8037313/raw/a6d52180305f027037ffcb16350d50ded072d5c6/gistfile1.js > $conf
