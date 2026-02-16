setup() {
    load 'test_helper.bash'
    load_libraries
}

@test "Testing no arguments" {
    run ./05_maximum_of_two/solution.sh
    assert_failure 1
    assert_output --partial "Usage:"
}
@test "Testing one argument" {
    run ./05_maximum_of_two/solution.sh 5
    assert_failure 1
    assert_output --partial "Usage:"
}
@test "Testing first argument non-numeric" {
    run ./05_maximum_of_two/solution.sh a 1
    assert_failure 1
    assert_output --partial "Error:"
}
@test "Testing second argument non-numeric" {
    run ./05_maximum_of_two/solution.sh 2 b
    assert_failure 1
    assert_output --partial "Error:"
}
@test "Testing two positive numbers" {
    run ./05_maximum_of_two/solution.sh 128 553
    assert_success
    assert_output "The maximum is: 553"
}
@test "Testing one positive number and zero" {
    run ./05_maximum_of_two/solution.sh 100 0
    assert_success
    assert_output "The maximum is: 100"
}
@test "Testing one positive and one negative number" {
    run ./05_maximum_of_two/solution.sh 125 -33
    assert_success
    assert_output "The maximum is: 125"
}
@test "Testing two zeros" {
    run ./05_maximum_of_two/solution.sh 0 0
    assert_success
    assert_output "The maximum is: 0"
}
@test "Testing one negative and zero" {
    run ./05_maximum_of_two/solution.sh -8 0
    assert_success
    assert_output "The maximum is: 0"
}
@test "Testing two negative numbers" {
    run ./05_maximum_of_two/solution.sh -16 -32
    assert_success
    assert_output "The maximum is: -16"
}