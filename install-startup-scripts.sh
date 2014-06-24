#!/usr/bin/env bash

bin_dir=$HOME/bin
start_lively_script=$bin_dir/start-lively.sh

mkdir -p $bin_dir

# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

cat > $start_lively_script <<"EOF"
#!/bin/bash

. $HOME/.nvm/nvm.sh
PORT=9001
DIR=/var/www/LivelyKernel
SCRIPT=$DIR/bin/lk-server.js
FOREVER=forever

# wait for vbox to be ready
while [ ! -f $SCRIPT ]; do sleep 2; done

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
