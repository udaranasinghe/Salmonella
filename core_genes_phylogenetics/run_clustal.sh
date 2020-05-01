#!/bin/bash

# create a nice multiple protein alignment

for PEP in *best.pep.fas.fmt ; do

  clustalo -i $PEP --threads=8 -outfmt=clu -o $PEP.clu

done

