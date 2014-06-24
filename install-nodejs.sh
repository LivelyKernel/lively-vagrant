#!/bin/bash

# install nvm
git clone https://github.com/creationix/nvm.git ~/.nvm

# make sure the shell knows about nvm
if [ -z "`grep 'source nvm' $HOME/.profile`" ]; then echo 'source $HOME/.nvm/nvm.sh' >> $HOME/.profile; fi
if [ -z "`grep 'nvm use' $HOME/.profile`" ]; then echo 'nvm use 0.10' >> $HOME/.profile; fi
source ~/.profile

# install node.js 0.10
nvm install v0.10
sleep 2

# some nodejs modules, e.g. sqlite require compile support:
npm install -g node-gyp

# for running the servers with auto restart
npm install -g forever

# for debugging
npm install -g node-inspector
