#!/bin/bash
set -e

fastqc data/raw/*.fastq -o results/qc_raw/
