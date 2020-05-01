#!/bin/bash

#unicycler -1 short_reads_1.fastq.gz -2 short_reads_2.fastq.gz -o output_dir
#unicycler  -1 100346_R1.fq.gz  -2 100346_R2.fq.gz  -o 100346

for FQZ1 in *_R1.fq.gz ; do
  FQZ2=$(echo $FQZ1 | sed 's/_R1.fq.gz/_R2.fq.gz/' )
  PFX=$(echo $FQZ1 | cut -d '_' -f1)
  echo $FQZ1 $FQZ2 $PFX
  unicycler  -1 $FQZ1 -2 $FQZ2  -o $PFX
done

