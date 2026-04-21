#!/bin/bash -ue
seqkit stats \
    --all \
    --tabular \
    --threads 2 \
    sample01_trimmed_1.fastq.gz sample01_trimmed_2.fastq.gz \
    > sample01_seqkit_stats.tsv
