#!/bin/bash
set -e

fastp \
  -i data/raw/SRR2584863_1.fastq -I data/raw/SRR2584863_2.fastq \
  -o results/trimmed/SRR2584863_1.trim.fastq \
  -O results/trimmed/SRR2584863_2.trim.fastq \
  --detect_adapter_for_pe \
  --json results/qc_trimmed/fastp.json \
  --html results/qc_trimmed/fastp.html
