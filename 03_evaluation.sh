#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/config.sh"
# ASSEMBLIES: list of FASTA files to compare
ASSEMBLIES=${@:?"usage: 03_evaluation.sh a.fasta b.fasta ..."}
quast.py -t $THREADS -o $OUT/quast $ASSEMBLIES
for a in $ASSEMBLIES; do
  busco -i $a -l bacteria_odb10 -m genome -c $THREADS -o busco_$(basename $a .fasta) --out_path $OUT/busco
done
