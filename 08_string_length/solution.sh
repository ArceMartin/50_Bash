#!/usr/bin/env bash

# String Length: Count the number of characters in a string.

stringLength() {
    echo "${#1}"
}

validate_args() {
    if [[ "$#" -lt 1 ]]; then
        echo "Usage: "$0" <string>"
        return 1
    fi
}

main() {
    validate_args "$#" || exit 1
    length=$(stringLength "$1")
    echo "The length of '$1' is: $length"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]];then
    main "$@"
fi