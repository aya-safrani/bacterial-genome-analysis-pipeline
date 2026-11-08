#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/config.sh"
BEST=${1:?"best assembly (fasta)"}
# Structural annotation (two tools, cross-checked)
prokka --outdir $OUT/prokka --prefix $SAMPLE --cpus $THREADS $BEST
bakta --output $OUT/bakta --prefix $SAMPLE --threads $THREADS $BEST   # requires the Bakta database
# Functional annotation from the Bakta proteins
emapper.py -i $OUT/bakta/$SAMPLE.faa -o $SAMPLE --output_dir $OUT/eggnog --cpu $THREADS
