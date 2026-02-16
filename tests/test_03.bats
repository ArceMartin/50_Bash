setup() {
    load 'test_helper.bash'
    load_libraries
}

@test "Testing positive length" {
    run ./03_square_area/solution.sh 6
    assert_success
    assert_output '36'
}

@test "Testing failing with no arguments" {
    run ./03_square_area/solution.sh
    assert_failure
    assert_output --partial "Usage:"
}

@test "Testing a negative length" {
    run ./03_square_area/solution.sh -5
    assert_failure
    assert_output --partial "Error:"
}

@test "Testing a non-numeric argument" {
    run ./03_square_area/solution.sh sdfs
    assert_failure
    assert_output --partial "Error:"
}