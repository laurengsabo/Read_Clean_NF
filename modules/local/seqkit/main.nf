process SEQKIT {
    tag "${meta.id}"

    container 'quay.io/biocontainers/seqkit:2.8.2--h9ee0642_0'

    publishDir "${params.outdir}/seqkit/${meta.id}", mode: 'copy'

    input:
    tuple val(meta), path(reads)

    output:
    path "${meta.id}_seqkit_stats.tsv", emit: stats

    script:
    def prefix = meta.id
    """
    seqkit stats \\
        --all \\
        --tabular \\
        --threads ${task.cpus} \\
        ${reads[0]} ${reads[1]} \\
        > ${prefix}_seqkit_stats.tsv
    """
}