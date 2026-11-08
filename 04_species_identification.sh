#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/config.sh"
BEST=${1:?"best assembly (fasta)"}
REFDIR=${2:?"directory with reference genomes (fasta), e.g. downloaded with NCBI Datasets"}
parsnp -r $BEST -d $REFDIR -p $THREADS -o $OUT/parsnp      # core-genome phylogeny -> view tree in iTOL
for ref in $REFDIR/*.fna; do
  fastANI -q $BEST -r $ref -o $OUT/fastani_$(basename $ref).txt
done
