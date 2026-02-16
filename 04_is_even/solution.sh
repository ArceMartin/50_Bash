#!/usr/bin/env bash

# Is Even: Check if a given number is even or odd.

is_even() {
    (( $1 % 2 == 0 ))
}

validate_args() {
    if [[ "$#" -ne 1 ]]; then
        echo "Usage: $0 <number>"
        return 1
    fi

    if ! [[ "$1" =~ ^-?[0-9]+$ ]]; then
        echo "Error: argument must be an integer"
        return 1
    fi

    if ! [[ "$1" -gt 0 ]]; then
        echo "Error: argument must be a positive integer"
        return 1
    fi
}

main() {
    validate_args "$@" || exit 1
    if is_even "$1"; then
        echo "The number is even"
    else
        echo "The number is odd"
    fi
}

main "$@"