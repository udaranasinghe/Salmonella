#!/bin/bash
#100490/PROKKA_02122019.gff
#100490-scaffolds.fa

rm *gff ; for GFF in `find . | grep gff$` ; do
  NAME=$(echo $GFF | sed 's@/@_@2' | sed 's@gff@gff3@' )
#  PFX=$(echo $GFF | cut -d '/' -f2)
#  FA=${PFX}-scaffolds.fa
  cp $GFF $NAME
#  echo "##FASTA" >> $NAME
#  cat $FA >> $NAME
done

