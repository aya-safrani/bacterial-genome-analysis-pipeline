#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/config.sh"
mkdir -p $OUT/qc $OUT/trimmed
fastqc -t $THREADS -o $OUT/qc $R1 $R2
# Light trimming (condition 2); condition 1 uses the raw reads
trimmomatic PE -threads $THREADS $R1 $R2 \
  $OUT/trimmed/${SAMPLE}_R1_P.fq.gz $OUT/trimmed/${SAMPLE}_R1_U.fq.gz \
  $OUT/trimmed/${SAMPLE}_R2_P.fq.gz $OUT/trimmed/${SAMPLE}_R2_U.fq.gz \
  LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:50
