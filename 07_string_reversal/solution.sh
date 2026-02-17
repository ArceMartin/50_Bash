#!/usr/bin/env bash

# String Reversal: Reverse a given string.

string_reversal() {
    local original="$1"
    local rev=""
    for (( i=0; i<${#original}; i++ )) do
        rev="${original:i:1}$rev"
    done
    echo "$rev"
}

validate_args() {
    if [[ "$#" -lt 1 ]]; then
        echo "Usage: $0 <string_to_reverse>"
        return 1
    fi
}

main() {
    validate_args "$@" || exit 1
    reversed=$(string_reversal "$1")
    echo "Original string: '$1'. Reversed: '$reversed'"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi