#!/usr/bin/env bash

function createInitdScript() {
    name=$1
    script=$2
    path=/etc/init.d/$name
    if [ -f $path ]; then
        rm $path
        update-rc.d -f $name remove
    fi
    cat > $path <<EOF
#! /bin/sh
# /etc/init.d/$name
#

# carry out specific functions when asked to by the system
case "\$1" in
    start)
        su - $SERVICE_USER -c "bash -c '$script'"
        ;;
    stop)
        su - $SERVICE_USER -c "bash -c '$script --stop'"
        ;;
    *)
        echo "Usage: /etc/init.d/$name {start|stop}"
        exit 1
        ;;
esac
exit 0
EOF
    chmod a+x $path
    update-rc.d $name defaults
    # to deactive
    # update-rc.d -f $name remove
}

# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

SERVICE_USER=vagrant
bin_dir=/home/$SERVICE_USER/bin

createInitdScript lively-server $bin_dir/start-lively.sh
service lively-server start

createInitdScript vwf-server $bin_dir/start-vwf.sh
service vwf-server start
