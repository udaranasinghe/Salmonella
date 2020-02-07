#!/bin/bash

for FA in $(find . | grep .fasta$ ) ; do

  N_CONTIGS=$(grep -c '>' $FA)

  perl -pe '/^>/ ? print "\n" : chomp' $FA | cut -d ' ' -f1 \
  | sed 1d | paste - - |  awk '{print length($2)}' \
  | perl -ne 'chomp(); push(@contigs,$_);$total+=$_;END{foreach(sort{$b<=>$a}@contigs){$sum+=$_;$L=$_;if($sum>=$total*0.5){print "TOTAL: $total\nN50: $L\n";exit;} ;}}' \
  | awk '{print $NF}' | paste - - | sed "s#^#${FA}\t${N_CONTIGS}\t#"

done | tee metrics.tsv |sort -k4gr | head -20| column -t

echo output written to file metrics.tsv
