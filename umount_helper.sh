#!/bin/bash

if [[ $(stat -fc %T ./work_dir/x86_64/airootfs/proc) == *"proc"* ]]; then
     echo "PROC STILL THERE !!!"
     sudo umount ./work_dir/x86_64/airootfs/proc
fi
