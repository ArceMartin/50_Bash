setup() {
    load 'test_helper.bash'
    load_libraries
}

@test "Testing the sum of two positive numbers" {
    run ./02_add_two_numbers/solution.sh 5 7
    assert_output '12'
}

@test "Testing the sum of negative numbers" {
    run ./02_add_two_numbers/solution.sh -5 -7
    assert_success
    assert_output '-12'
}

@test "Testing the sum of positive and negative numbers" {
    run ./02_add_two_numbers/solution.sh 10 -3
    assert_success
    assert_output '7'
}

@test "Fails with only one argument" {
    run ./02_add_two_numbers/solution.sh 5
    assert_failure
    assert_output --partial "Usage:"
}

@test "Fails with no arguments" {
    run ./02_add_two_numbers/solution.sh
    assert_failure
    assert_output --partial "Usage:"
}

@test "Handles more than two arguments (ignores extras)" {
    run ./02_add_two_numbers/solution.sh 5 7 10
    assert_success
    assert_output '12'
}