#!/usr/bin/env nextflow

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
    print(f'python: Hello {x}')
    #print("Test")
    """
}

workflow {
  name_ch = Channel.of(params.name)
  results_ch = SAYHELLO(name_ch)
  results_ch.view {it}
}