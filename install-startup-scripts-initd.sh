#!/usr/bin/env bash

SERVICE_USER=vagrant
bin_dir=/home/$SERVICE_USER/bin

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
        su - $SERVICE_USER -c "bash -c '$script >> $bin_dir/$name.log 2>&1' &"
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
    update-rc.d $name defaults 99
    # to deactive
    # update-rc.d -f $name remove
}

# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

createInitdScript lively-server $bin_dir/start-lively.sh
service lively-server start
