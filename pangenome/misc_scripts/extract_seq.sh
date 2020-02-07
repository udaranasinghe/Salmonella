#!/bin/bash

##########################################################
#  perform a phylogenetic analysis for every single gene
#  mark ziemann october 2019
##########################################################

# extract all sequences from the silly gff3 files
for GFF in *.gff ; do

  ISOLATE=$(echo $GFF | cut -d '/' -f1)

  echo $ISOLATE >&2

  SEQ_START=$(grep -m1 -n '^>' $GFF  | cut -d ':' -f1)
  SEQ_END=$(wc -l < $GFF)

  sed -n ${SEQ_START},${SEQ_END}p $GFF > $GFF.fa

  samtools faidx $GFF.fa

done


# extract gene sequences for each gene to make multi-fasta files
GENETBL=/mnt/md0/salmonella/pangenome_unicycler/roary_1569824294/gene_presence_absence.Rtab

for GENE in $(cut -f1 $GENETBL | sed 1d )  ; do

  for GFF in *gff ; do

    ISOLATE=$(echo $GFF | cut -d '/' -f1)

    GENECNT=$(grep -wc $GENE $GFF)

    echo $GFF $GENE >&2

    if [ $GENECNT -gt 0 ] ; then

      # here I supply extra columns to bedtools getfasta because it seems to work with BED6 but not BED4

      grep -w $GENE $GFF | awk '{OFS="\t"} {print $1,$4-1,$5,$7,$7,$7}' \
      | bedtools getfasta -s -fi $GFF.fa -bed - \
      | sed "s/>/>${ISOLATE}_${GENE}_/"

    fi
  done > $GENE.fa
done

# clean up the gff files
rm *gff*fa

# run the sequences through clustalo
for FA in *fa ; do

  echo $FA >&2

  CNT=$(grep -c '>' $FA)

  if [ $CNT -gt 1 ] ; then

    clustalo -i $FA --guidetree-out=$FA.tree --force --outfmt=clu > $FA.clu

  fi

done


#prank -d=thyA.fa -o=output_codon -codon -F
