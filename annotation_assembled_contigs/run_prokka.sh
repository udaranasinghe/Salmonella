#!/bin/bash

for FASTA in $(find . | grep fasta) ; do
  OUTPUT=$(echo $FASTA | sed 's#\/#\-#2' )
  cp $FASTA $OUTPUT
done


for FA in *fasta ; do
  PFX=$(echo $FA | sed 's/-scaffolds.fa//')
  /home/mdz/prokka/bin/prokka --force --outdir $PFX \
  --genus Salmonella --species enterica --kingdom Bacteria  $FA
done

