#!/usr/bin/env bash

sudo mkdir -p /var/www;
sudo chown -R vagrant:vagrant /var/www;
cd /var/www;

if [ -d LivelyKernel ]; then rm -rf LivelyKernel; fi
git clone https://github.com/LivelyKernel/LivelyKernel
cd LivelyKernel
ln -fs $PWD $HOME/LivelyKernel
npm install

node -e "require('./bin/env'); require('./bin/helper/download-partsbin')();"
