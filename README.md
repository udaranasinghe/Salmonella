# Salmonella genomics project
## Authors
Who is the author?
## Motivation
What is the motivation?
## Contents
SEquence quality check
De novo assembly
De novo assembly with unicycler
Assembly quality check
Annotation of assembbled contigs
Prokka
Pangenome construction
characterization of circular contigs
core gene phylogenetics

* extract_seq.sh
purpose is extracting Sequences for each gene in each isolate.
inputs were the all gff files resulted from prokka and gene_presence_abscence.Rtab resulred fronm Roary.
Output is the fasta file which contains sequences for each gene($GENE.fa) 

* codon_alignment_kaks.sh
Purpose is trnslating the gene sequence results from the "extract_seq.sh" into nucleotide and peptide sequences  .
Inputs are the extracted sequences from "extract_seq.sh".
Outputs are fasta files which contain nucleotide and peptide sequences.

* run_clustal.sh
Purpose is to characterise the homologs among core genes.
Inputs are the peptide sequences in fasta format resulted from "codon_alignment_kaks.sh".
Outpus are the $PEP.clu files which exhibit the homologs.



For each script, provide
* name of script
* purpose
* input and outputs 
### metrics.sh
Purpose .......
Inputs are..
outputs are....
