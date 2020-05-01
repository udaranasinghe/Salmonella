#!/bin/bash
docker run --rm -it -v /mnt/md0/salmonella/roary:/data/ sangerpathogens/roary roary -p 8 -e -n -v -f /data/ $(ls *gff3 | awk '{print "/data/"$1}' )

