workflow runExample {
    call helloworld

    output{
        File hello="~{helloworld.outputHello}"
    }
}

task helloworld {
    input {
        File name
        String output_name
    }

    command <<<
        echo "Hello `cat ~{hello}`" > ~{outputHello}
    >>>

    output {
        File outputHello="~{output_name}.txt"
    }
}
