# Method notes

1. **Quality control**: FastQC on the paired-end reads.
2. **Trimming strategy**: raw reads vs light trimming (Trimmomatic `LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:50`), validated with the supervisor.
3. **Assembly**: 6 assemblers x 2 conditions = 12 assemblies, compared with QUAST and BUSCO.
4. **Choice of the reference assembly**: best compromise between contiguity (contigs, N50) and completeness (BUSCO).
5. **Species identification**: 16S was not discriminant inside the *Enterobacter cloacae* complex, so a core-genome phylogeny (Parsnp) with reference genomes plus fastANI was used.
6. **Annotation**: Prokka and Bakta (structural, cross-checked), eggNOG-mapper (functional).
7. **Targeted gene search** on the annotation, then interpretation.

All commands were recorded in a command journal to keep the work traceable.
