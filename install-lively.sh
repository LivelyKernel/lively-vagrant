#!/usr/bin/env bash

if [ -d LivelyKernel ]; then rm -rf LivelyKernel; fi

cd /vagrant/
git clone -b vwf-compat https://github.com/LivelyKernel/LivelyKernel
cd /vagrant/LivelyKernel
ln -s $PWD $HOME/LivelyKernel
npm install
