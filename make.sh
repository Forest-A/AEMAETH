#!/bin/bash

compile() {
    code=$1
    output=$2

    echo "Compiling $code into $output"

    g++ -std=c++17 -fPIC -o $output $code $(root-config --cflags --libs) -lMinuit

    if [ -e $output ]; then
        echo "Compilation successful: $output"
    else
        echo "Compilation failed"
    fi
}

if [ $# -ne 2 ]; then
    echo "Usage: $0 source_file output_executable"
    exit 1
fi

compile $1 $2
