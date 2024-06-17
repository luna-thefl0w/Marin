#!/bin/bash
# fuck idc
sleep 60
for i in $(pm list packages | cut -d':' -f2); do
    cmd package log-visibility --disable $i
done
exit 0