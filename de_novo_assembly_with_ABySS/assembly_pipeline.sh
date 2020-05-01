#!/bin/bash
set -x
# application paths
SKEWER="${PWD}/../app/skewer/skewer"
FASTQC="${PWD}/../app/fastqc"
ABYSSPE="${PWD}/../app/abyss-pe"
BFC="${PWD}/../app/bfc/bfc"
k=121
c=40

for FQZ1 in *_R1.fq.gz ; do

  FQZ2=$(echo $FQZ1 | sed 's/_R1.fq.gz/_R2.fq.gz/')
  FQT1=$(echo $FQZ1 | sed 's/.fq.gz/.fq-trimmed-pair1.fastq/')
  FQT2=$(echo $FQZ1 | sed 's/.fq.gz/.fq-trimmed-pair2.fastq/')

  FQC=$(echo $FQT1 | sed 's/-pair1.fastq/-combined.fastq/')
  FQC1=$(echo $FQT1 | sed 's/-pair1.fastq/-pair1-corrected.fastq/')
  FQC2=$(echo $FQT2 | sed 's/-pair2.fastq/-pair2-corrected.fastq/')

  PFX=$(echo $FQZ1 | sed 's/_R1.fq.gz//')

  mkdir $PFX
  if [ ! -r $PFX/finished ] ; then
    cd $PFX
    ln ../$FQZ1 ../$FQZ2 .
    $FASTQC $FQZ1 $FQZ2
    $SKEWER -t 16 -q 20  $FQZ1 $FQZ2
    cat $FQT1 $FQT2 > $FQC
    $BFC  -t 16 -s 5.1m $FQC $FQT1 > $FQC1
    $BFC  -t 16 -s 5.1m $FQC $FQT2 > $FQC2
    $ABYSSPE  name=${PFX}  k=${k}  c=${c}  e=${c}  b=0  j=16  in="$FQC1 $FQC2" && touch finished
    cd -
  fi
done

