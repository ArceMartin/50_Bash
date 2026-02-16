setup() {
    load 'test_helper.bash'
    load_libraries
}

@test "Testing negative number" {
    run ./04_is_even/solution.sh -5
    assert_failure
    assert_output --partial "Error:"
}
@test "Testing zero" {
    run ./04_is_even/solution.sh 0
    assert_failure
    assert_output --partial "Error:"
}
@test "Testing odd number" {
    run ./04_is_even/solution.sh 5
    assert_success
    assert_output "The number is odd"
}
@test "Testing even number" {
    run ./04_is_even/solution.sh 12
    assert_success
    assert_output "The number is even"
}
@test "Testing non-number argument" {
    run ./04_is_even/solution.sh foo
    assert_failure
    assert_output --partial "Error:"
}