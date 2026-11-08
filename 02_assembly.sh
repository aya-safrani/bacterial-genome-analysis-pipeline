#!/usr/bin/env bash
# Comparative assembly: 6 assemblers. Run with raw reads, then with trimmed reads (set R1/R2 accordingly).
set -euo pipefail
source "$(dirname "$0")/config.sh"
COND=${1:-raw}   # raw | trimmed
mkdir -p $OUT/assembly/$COND
skesa --reads $R1,$R2 --cores $THREADS > $OUT/assembly/$COND/skesa.fasta
spades.py --isolate -1 $R1 -2 $R2 -t $THREADS -o $OUT/assembly/$COND/spades
megahit -1 $R1 -2 $R2 -t $THREADS -o $OUT/assembly/$COND/megahit
shovill --R1 $R1 --R2 $R2 --cpus $THREADS --outdir $OUT/assembly/$COND/shovill
unicycler -1 $R1 -2 $R2 -t $THREADS -o $OUT/assembly/$COND/unicycler
# Velvet (k=31)
velveth $OUT/assembly/$COND/velvet 31 -shortPaired -fastq.gz -separate $R1 $R2
velvetg $OUT/assembly/$COND/velvet
