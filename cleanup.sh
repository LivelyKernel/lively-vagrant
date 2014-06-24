#!/bin/bash

sudo apt-get clean

# Zero out the rest of the free space using dd, then delete the written file.
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY

# Add `sync` so we don't quit too early, before the large file is deleted.
sync
