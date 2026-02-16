#!/usr/bin/env bash

# Convert a temperature from fahrenheit to celsius

ftc() {
  local result=$(echo "scale=10; ($1 - 32) * 5 / 9" | bc -l)
  printf "%.2f\n" "$result"
}

validate_args() {
    if [[ "$#" -ne 1 ]]; then
        echo "Usage: $0 <number>"
        return 1
    fi

    if ! [[ "$1" =~ ^-?[0-9]+$ ]]; then
        echo "Error: Argument must be an integer number"
        return 1
    fi
}

main() {
    validate_args "$@" || exit 1
    converted=$(ftc "$1")
    echo "$1 fahrenheit degrees = $converted celsius degrees"
}

# Only execute main if the script is run directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi