#!/bin/bash -ue
spades.py \
    -1 sample01_trimmed_1.fastq.gz \
    -2 sample01_trimmed_2.fastq.gz \
    -o spades_out \
    --threads 2 \
    --memory 4 \
    --careful

cp spades_out/contigs.fasta sample01_contigs.fasta
cp spades_out/spades.log    sample01_spades.log
