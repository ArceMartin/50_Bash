#!/usr/bin/env bash

# Maximum of Two: Find the larger of two given numbers.

max_of_two() {
    if [[ $1 -lt $2 ]]; then
        echo "$2"
    else
        echo "$1"
    fi
}

validate_args() {
    if [[ "$#" -ne 2 ]]; then
        echo "Usage: $0 <number1> <number2>"
        return 1
    fi

    for arg in "$@"; do
        if ! [[ "$arg" =~ ^-?[0-9]+$ ]]; then
            echo "Error: All arguments must be integers"
            return 1
        fi
    done
}

main() {
    validate_args "$@" || exit 1
    max=$(max_of_two $1 $2)
    echo "The maximum is: $max"
}

main "$@"