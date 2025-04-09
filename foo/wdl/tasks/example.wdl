workflow runExample {
    call helloworld

    output{
        File hello = helloworld.outputHello
    }
}

task helloworld {
    input {
        File name
        String output_name
    }

    command <<<
        namefile = $(basename ~{name}) | sed s/.txt$//'
        echo "Hello `cat $namefile`" > ~{outputHello}
    >>>

    output {
        File outputHello="~{output_name}.txt"
    }
}
