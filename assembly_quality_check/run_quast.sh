#!/bin/bash
mkdir quast_files

for FA in $(find . | grep contigs.fa) ; do
  COV=$(echo $FA | cut -d '/' -f2)
  PFX=$(basename $FA | sed 's/.fa//' )
  NAME=$PFX.$COV.fa
  echo $FA
  cp $FA quast_files/$NAME
done

../sw/quast-5.0.2/quast.py  $(find quast_files | grep fa$) \
-r ../ref/GCF_000195995.1_ASM19599v1_genomic.fna \
-g ../ref/GCF_000195995.1_ASM19599v1_genomic.gff

