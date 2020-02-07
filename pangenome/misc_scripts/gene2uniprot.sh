#!/bin/bash

zcat 100*.gff3.gz | grep -i uniprot \
| sed 's/gene=/\n=/' | sed 's/UniProtKB:/\n:/' \
| cut -d ';' -f1 | egrep '(^=|^:)' \
| tr '\n' '\t' | sed 's/=/\n/g' \
| tr -d ':' | sort -u > gene2uniprot.tsv

