#!/bin/bash

# so now we gunna run blast all vs all

if [ ! -r circ.fa.nsq ] ; then
  formatdb -i circ.fa -p F -o T
fi

blast2 -p blastn -d circ.fa -i circ.fa -m8 \
| cut -f1,2,12 > circ.out



