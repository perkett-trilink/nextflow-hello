#!/usr/bin/env nextflow

params.name = "Matt"
name_ch = Channel.of(params.name) 

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
  results_ch = SAYHELLO(name_ch)
  results_ch.view {it}
}
