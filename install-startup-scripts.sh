#!/usr/bin/env bash

bin_dir=$HOME/bin
start_lively_script=$bin_dir/start-lively.sh
start_vwf_script=$bin_dir/start-vwf.sh

mkdir -p $bin_dir

# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

cat > $start_lively_script <<"EOF"
#!/bin/bash

. $HOME/.nvm/nvm.sh
PORT=9001
DIR=$HOME/LivelyKernel
SCRIPT=$DIR/bin/lk-server.js
FOREVER=forever

if [ "$1" == "--stop" ]; then
   $FOREVER stop $SCRIPT
else
    forever_out=`$FOREVER list | grep $PORT`
    if [ -z "$forever_out" ]; then
        $FOREVER start --spinSleepTime 800 \
            $SCRIPT -p $PORT
    fi
fi

EOF

chmod a+x $start_lively_script

# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

cat > $start_vwf_script <<"EOF"
#!/bin/bash

. $HOME/.nvm/nvm.sh
PORT=3000
DIR=$HOME/vwf
SCRIPT=$DIR/node-server.js
FOREVER=forever

if [ "$1" == "--stop" ]; then
   $FOREVER stop $SCRIPT
else
    forever_out=`$FOREVER list | grep $PORT`
    if [ -z "$forever_out" ]; then
        cd $DIR
        $FOREVER start $SCRIPT
    fi
fi
EOF

chmod a+x $start_vwf_script
