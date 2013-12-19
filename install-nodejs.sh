#!/bin/bash

# install nvm
curl https://raw.github.com/creationix/nvm/master/install.sh | sh
source ~/.profile

# install node.js 0.10
nvm install v0.10
sleep 2

# make sure the shell knows about nvm
if [ -z "`grep 'nvm use' .profile`" ]; then echo "nvm use 0.10" >> .profile; fi
source ~/.profile
nvm use 0.10

# some nodejs modules, e.g. sqlite require compile support:
npm install -g node-gyp

# for running the servers with auto restart
npm install -g forever
