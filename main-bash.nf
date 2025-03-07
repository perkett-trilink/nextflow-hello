#!/usr/bin/env nextflow

process SAYHELLO {
  input: 
    val x
  
  output:
    stdout
  
  script:
    """
    echo "bash: Hello ${x}"
    """
}

workflow {
  name_ch = Channel.of(params.name)
  results_ch = SAYHELLO(name_ch)
  results_ch.view {it}
}
