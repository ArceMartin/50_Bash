#!/usr/bin/env bash

# Simple Interest: I = P * R * T
# Where:
#   P = principal
#   R = annual rate in percent (e.g. 5 means 5%)
#   T = time in years
#
# All values may be floating-point and must be non-negative.

simple_interest() {
    local principal=$1
    local rate_percent=$2
    local time=$3

    bc -l <<EOF
scale=3
$principal * ($rate_percent / 100) * $time
EOF
}

is_number() {
    [[ $1 =~ ^([0-9]+([.][0-9]+)?|[.][0-9]+)$ ]]
}

validate_args() {
    if [[ "$#" -ne 3 ]]; then
        printf "Usage: %s <principal> <rate_percent> <time>\n" "$0" >&2
        return 1
    fi

    for arg in "$@"; do
        if ! is_number "$arg"; then
            printf "Error: '%s' is not a valid non-negative number\n" "$arg" >&2
            return 1
        fi
    done
}

main() {
    validate_args "$@" || exit 1

    local principal=$1
    local rate=$2
    local time=$3

    local interest
    interest=$(simple_interest "$principal" "$rate" "$time")

    printf "Given:\n"
    printf "  Principal: %s\n" "$principal"
    printf "  Rate:      %s%%\n" "$rate"
    printf "  Time:      %s\n" "$time"
    printf "Simple Interest: %s\n" "$interest"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]];then
    main "$@"
fi