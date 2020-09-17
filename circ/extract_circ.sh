#!/bin/bash


# should be run in /mnt/md0/salmonella/assembly_unicycler/unicycler_assembly
# where the assembly.fasta files are

grep 'circ' *.fasta > circ.txt

for CIRC in $(awk '{print $1}' circ.txt ) ; do

  DB=$(echo $CIRC | cut -d ':' -f1)

  ISO=$(echo $DB | cut -d '.' -f1)

  ENTRY=$(echo $CIRC | cut -d '>' -f2)

  blastdbcmd  -db $DB -entry $ENTRY \
  | sed "s/>/>${ISO}_/"

done > circ.fa


rm circ.txt

