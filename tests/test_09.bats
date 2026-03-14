setup() {
    load 'test_helper.bash'
    load_libraries
    source ./09_simple_interest/solution.sh
}

@test "test 1" {
    actual=$(simple_interest "7500" "10.5" "22")
    assert_equal "$actual" "17325.000"
}

@test "test 2" {
    actual=$(simple_interest "0" "50" "78")
    assert_equal "$actual" "0"
}

@test "test 3" {
    actual=$(simple_interest "42500" "7.5" "100")
    assert_equal "$actual" "318750.000"
}

@test "script: no arguments" {
    run ./09_simple_interest/solution.sh
    assert_failure 1
    assert_output --partial "Usage:"
}

@test "script: non-number argument" {
    run ./09_simple_interest/solution.sh "100" "x" "100"
    assert_failure 1
    assert_output --partial "Error:"
}

@test "reject negative principal" {
    run ./09_simple_interest/solution.sh "-100" "5" "1"
    assert_failure
}

@test "reject negative rate" {
    run ./09_simple_interest/solution.sh "100" "-5" "1"
    assert_failure
}

@test "reject negative time" {
    run ./09_simple_interest/solution.sh "100" "5" "-1"
    assert_failure
}

@test "accept fractional time" {
    actual=$(simple_interest "100" "5" "0.5")
    assert_equal "$actual" "2.500"
}
