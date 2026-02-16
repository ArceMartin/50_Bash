#!/usr/bin/env bash

# Produce the sum of two numbers

add_two_numers() {
    # Use double parenthesis to perform arithmetic operations
    echo $(( $1 + $2 ))
}

validate_args() {
    if [[ "$#" -lt 2 ]]; then
        echo "Usage: $0 arg1 arg2"
        return 1
    fi
}

main() {
    validate_args "$@" || exit 1
    add_two_numers "$1" "$2"
}

# --- Entry point ---

main "$@"