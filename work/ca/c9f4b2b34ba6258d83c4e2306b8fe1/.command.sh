#!/bin/bash -ue
fastp \
    --in1 sample01_R1.fastq.gz \
    --in2 sample01_R2.fastq.gz \
    --out1 sample01_trimmed_1.fastq.gz \
    --out2 sample01_trimmed_2.fastq.gz \
    --json sample01_fastp.json \
    --html sample01_fastp.html \
    --thread 2 \
    --detect_adapter_for_pe \
    --qualified_quality_phred 20 \
    --length_required 50
