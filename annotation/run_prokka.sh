#!/bin/bash
for FA in *fa ; do
  PFX=$(echo $FA | sed 's/-scaffolds.fa//')
  ~/prokka/bin/prokka --force --proteins ../ref/NC_003198.gb --outdir $PFX \
  --genus Salmonella --species enterica --kingdom Bacteria  $FA
done

