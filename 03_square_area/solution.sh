#!/usr/bin/env bash

# Find the area of a square based on the length of one of its sides.

square() {
    echo $(( $1 * $1 ))
}

validate_args() {
    if [[ "$#" -lt 1 ]]; then
        echo "Usage: $0 <positive-integer>"
        return 1
    fi

    if ! [[ "$#" =~ ^-?[0-9]+$ ]]; then
        echo "Error: argument must be an integer"
        return 1
    fi

    if (( "$1" <= 0 )); then
        echo "Error: argument must be a positive integer"
        return 1
    fi
}

main() {
    validate_args "$@" || exit 1
    square "$1"
}

main "$@"