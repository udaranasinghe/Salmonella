#!/bin/bash
set -x
#cycle through kmer and coverage values to get the best assembly
#ABYSSPE=../app/abyss-pe
BFC=../app/bfc/bfc
FQT1=100489_R1.fq-trimmed-pair1.fastq
FQT2=100489_R1.fq-trimmed-pair2.fastq
for k in 31 41 51 61 71 81 101 121 141 161; do
  for c in 3 5 10 15 20 25 35 50 ; do
    PFX=k${k}_c${c}
    mkdir $PFX
    if [ ! -r $PFX/finished ] ; then
      #abyss-pe -c $PFX k=$k c=$c e=$c b=0 j=$nproc in="$FQT1 $FQT2" && touch $PFX/finished
      abyss-pe -C $PFX name=test k=$k c=$c e=$c b=0 j=16 in="../$FQT1 ../$FQT2" && touch $PFX/finished
    fi
  done
done

FQC=$(echo $FQT1 | sed 's/-pair1.fastq/-combined.fastq/')
FQC1=$(echo $FQT1 | sed 's/-pair1.fastq/-pair1-corrected.fastq/')
FQC2=$(echo $FQT2 | sed 's/-pair2.fastq/-pair2-corrected.fastq/')

#
#cat $FQT1 $FQT2 > $FQC
#$BFC  -t 16 -s 5.1m $FQC $FQT1 > $FQC1
#$BFC  -t 16 -s 5.1m $FQC $FQT2 > $FQC2


for k in 31 41 51 61 71 81 101 121 141 161; do
  for c in 3 5 10 15 20 25 35 50 ; do
    PFX=bfc_k${k}_c${c}
    mkdir $PFX
    if [ ! -r $PFX/finished ] ; then
      abyss-pe -C $PFX name=test k=$k c=$c e=$c b=0 j=16 in="../$FQC1 ../$FQC2" && touch $PFX/finished
    fi
  done
done

