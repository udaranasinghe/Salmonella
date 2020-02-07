#!/bin/bash
docker run --rm -dit -v ${PWD}:/data/ sangerpathogens/roary roary -p 8 -e -n -v -f /data/ $(ls *gff3 | awk '{print "/data/"$1}' )

