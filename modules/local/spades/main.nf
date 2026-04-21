process SPADES {
    tag "${meta.id}"

    container 'staphb/spades:4.0.0'

    publishDir "${params.outdir}/spades/${meta.id}", mode: 'copy'

    input:
    tuple val(meta), path(reads)

    output:
    tuple val(meta), path("${meta.id}_contigs.fasta"), emit: contigs
    path "${meta.id}_spades.log",                       emit: log

    script:
    def prefix = meta.id
    """
    spades.py \\
        -1 ${reads[0]} \\
        -2 ${reads[1]} \\
        -o spades_out \\
        --threads ${task.cpus} \\
        --memory ${(task.memory.toGiga()).intValue()} \\
        --careful

    cp spades_out/contigs.fasta ${prefix}_contigs.fasta
    cp spades_out/spades.log    ${prefix}_spades.log
    """
}