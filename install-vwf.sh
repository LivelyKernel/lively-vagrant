#!/usr/bin/env bash

cd /vagrant/
git clone -b branch/morph https://github.com/virtual-world-framework/vwf --recursive

cd /vagrant/vwf/
ln -s $PWD $HOME/vwf
npm install
