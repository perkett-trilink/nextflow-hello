#!/usr/bin/env nextflow

params.name = "Matt"
name_ch = Channel.of(params.name) 

process SAYHELLO {
  input: 
    val x
  
  output:
    stdout
  
  script:
    // NOTE: running with a python shell is weird
    """
    #!/usr/bin/env python
    x = "$x"
    print(f'Hello {x}')
    #print("Test")
    """
}

workflow {
  results_ch = SAYHELLO(name_ch)
  results_ch.view {it}
}