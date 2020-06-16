# Salmonella genomics project
## Authors
Dr Mark Ziemann and 
Udari Ranasinge.
## Motivation
What is the motivation?
## Contents
#Sequence quality check
* run_fastqc.sh:
inputs are the Illumina sequencing files in fq.gz format, qc analysis is done ans html file was generated with MUliQC and FastQC results. 
* assembly_pipeline.sh
Illumina sequencing reads were used as inputs in _R1.fq.gz format.De novo assembly has performed with ABySS pipeline resulting assembly for 40 isolates.
* test_abyss-params.sh
cycle through Kmer and coverage values to get the best assembly.
* run_quast.sh
assembly files in fasta foormat, resulted from unicycler or ABySS were used as input files.
QUAST anlysis was run for the assembly.

* metrics.sh
Assembly results in fasta fomat were used as input.
extract the metrics from the assembly results.
genetates tsv file whih displays number of contigs with each sample.

* metricsPlots_script_contigs.R
AbyssMetrics.tsv.txt whish contain quality merics for QUAST analysis for ABySS eembly was used as input.
make the plots in R studio to compare the assembly quality of the three scafolds sets C30, C40, and C50 in ABySS. 

* unic.sh
Illumina sequencing reads were used as input files.
unicycler was run for the Illumina sequencing reads.
Assembly files were generated.

* run_prokka.sh
unicycler assembly files i fasta format have used as input files.
Proka was run for the unicycler assembly.
annotation files were generated for each isolate.

* extract_seq.sh
the gff3 files resulted from the Prokka anotation have used as input files.
extract every single gene from the gff3 files and convert into multifasta files(GENE.fa).
removed the parentheses becuuse it causes error with software.
perform the phylogenetic analysis for every single gene.
run the sequences through the clustalo and generrate the multiple aligment fasta files(FA.clu).

* codon_alignment_kaks.sh
Every single gene in fasta format have used as the input.
PRANK was run inorer to fing the molecular homology.


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
