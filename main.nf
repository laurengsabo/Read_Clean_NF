#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { FASTP  } from './modules/local/fastp/main'
include { SPADES } from './modules/local/spades/main'
include { SEQKIT } from './modules/local/seqkit/main'

workflow {

    // Read samplesheet
    ch_input = Channel
        .fromPath(params.input)
        .splitCsv(header: true)
        .map { row ->
            def meta = [id: row.sample]
            def reads = [file(row.fastq_1), file(row.fastq_2)]
            [ meta, reads ]
        }

    // Module 1 (sequential): Quality trimming with fastp
    FASTP(ch_input)

    // Module 2 + 3 (parallel): SPAdes assembly AND SeqKit stats
    SPADES(FASTP.out.reads)
    SEQKIT(FASTP.out.reads)
}
