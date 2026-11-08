# Bacterial genome analysis pipeline (PGPR strain E3)

Workflow for **de novo assembly, annotation, comparative analysis and phylogenomics** of a bacterial genome sequenced with Illumina paired-end reads.
Developed during a 2-month internship at INRA Rabat (CRRA, Biotechnology Research Unit), supervised by Pr. Rachid Mentag.

> This repository documents the **method** (steps, tools, parameters). Raw sequencing data and the strain's sequences are not included.

## Workflow

| Step | Goal | Tools |
|---|---|---|
| 1 | Read quality control | FastQC |
| 2 | Trimming strategy (raw vs light trimming) | Trimmomatic |
| 3 | Comparative assembly (6 assemblers x 2 conditions = 12 assemblies) | SKESA, SPAdes (`--isolate`), MEGAHIT, Velvet (k=31), Shovill, Unicycler |
| 4 | Assembly evaluation | QUAST, BUSCO (`bacteria_odb10`) |
| 5 | Species identification | Parsnp (core-genome phylogeny), fastANI, NCBI Datasets, iTOL |
| 6 | Structural annotation | Prokka, Bakta |
| 7 | Functional annotation | eggNOG-mapper (COG, GO, KEGG) |
| 8 | Targeted search of PGPR / stress-related genes | filtering of the eggNOG annotation (grep / Python) |
| 9 | Synthesis and figures | Python (Matplotlib) |

Light trimming used: `LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:50`.

## Main results (strain E3)

- Selected assembly: **SKESA without trimming** - 33 contigs, N50 = 281,715 bp, 4,787,037 bp, GC 56.5 %, BUSCO 97.6 % (`bacteria_odb10`, n = 124).
- Structural annotation (Prokka / Bakta): about 4,410 CDS, concordant between the two tools.
- Functional annotation (eggNOG-mapper): 4,207 genes with COG (97 %), 2,442 with GO, 3,104 with KEGG.
- Species: closest to *Enterobacter pasteurii* (core-genome phylogeny with 16 reference genomes, fastANI = 98.73 %).
- Targeted search: iron acquisition (siderophores, 15 genes) and abiotic stress tolerance (heavy metals, osmotic and oxidative stress).

## Repository content

```
scripts/        one script per step (templates to adapt: paths and sample names are variables)
docs/           method notes and command journal structure
environment.yml conda environment
```

## Reproducibility

- Conda environments to avoid dependency conflicts.
- Every command is recorded in a journal (43 steps) to keep the analysis traceable.
- Each conclusion is checked with at least two independent approaches (e.g. phylogeny + ANI).

## Lessons and perspectives

- A scaffolding step against a single reference genome was tested and then set aside: the reference species was not yet confirmed, so a comparative approach (phylogenomics + ANI) was preferred.
- Perspectives: secondary metabolite clusters (antiSMASH), secretome analysis, in vitro validation of siderophore production and stress tolerance, packaging the workflow in Snakemake.

## Author

Aya Safrani - bioinformatics engineering student, UM6SS Casablanca.
