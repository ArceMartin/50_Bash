setup() {
    load 'test_helper.bash'
    load_libraries
    source ./07_string_reversal/solution.sh
}

@test "reverse a string with no spaces" {
    actual=$(string_reversal "copilot")
    assert_equal "$actual" "tolipoc"
}
@test "reverse a string with spaces" {
    actual=$(string_reversal "John Smith")
    assert_equal "$actual" "htimS nhoJ"
}
@test "empty string" {
    actual=$(string_reversal "")
    assert_equal "$actual" ""
}
@test "script: no arguments" {
    run ./07_string_reversal/solution.sh
    assert_failure 1
    assert_output --partial "Usage:"
}
@test "script: reverse message" {
    run ./07_string_reversal/solution.sh "aliens"
    assert_success
    assert_output "Original string: 'aliens'. Reversed: 'sneila'"
}