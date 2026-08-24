#!/bin/bash
set -e

# Download reference genome
cd data/reference
wget -O ecoli.fasta.gz \
  "https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/005/845/GCF_000005845.2_ASM584v2/GCF_000005845.2_ASM584v2_genomic.fna.gz"
gunzip ecoli.fasta.gz
cd ../..

# Download sequencing data (FASTQ)
cd data/raw
prefetch SRR2584863
fasterq-dump SRR2584863 --split-files -O .
cd ../..
