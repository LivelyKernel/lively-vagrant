#!/usr/bin/env bash

cd /vagrant/
if [ -d vwf ]; then rm -rf vwf; fi
git clone -b branch/morph https://github.com/LivelyKernel/vwf --recursive

cd /vagrant/vwf/
ln -fs $PWD $HOME/vwf
npm install
