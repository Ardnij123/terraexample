workflow runExample {
    call helloworld

    output {
        File hello="${helloworld.outputHello}"
    }
}

task helloworld {

    File name
    String output_name

    command {
        echo "Hello `cat ${name}`" > ${output_name}.txt
    }

    output {
        File outputHello="${output_name}.txt"
    }
}
