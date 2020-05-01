#!/bin/bash

# run fastqc on the fastq files
# FastQC v0.11.5
for FQZ in *.fq.gz ; do
  echo $FQZ
  fastqc $FQZ
done

# multiqc, version 1.7
multiqc .

