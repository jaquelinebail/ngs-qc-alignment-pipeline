#!/bin/bash
set -e

# Index reference genome
bwa index data/reference/ecoli.fasta

# Align reads
bwa mem -t 4 data/reference/ecoli.fasta \
  results/trimmed/SRR2584863_1.trim.fastq \
  results/trimmed/SRR2584863_2.trim.fastq \
  > results/aligned/SRR2584863.sam

# Convert, sort, index
samtools view -bS results/aligned/SRR2584863.sam > results/aligned/SRR2584863.bam
samtools sort results/aligned/SRR2584863.bam -o results/aligned/SRR2584863.sorted.bam
samtools index results/aligned/SRR2584863.sorted.bam

# Alignment statistics
samtools flagstat results/aligned/SRR2584863.sorted.bam | tee results/aligned/flagstat.txt

# Clean up intermediates
rm results/aligned/SRR2584863.sam results/aligned/SRR2584863.bam
