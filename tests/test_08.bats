setup() {
    load 'test_helper.bash'
    load_libraries
    source ./08_string_length/solution.sh
}

@test "Empty string" {
    actual=$(stringLength "")
    assert_equal "$actual" "0"
}
@test "Single character string" {
    actual=$(stringLength "x")
    assert_equal "$actual" "1"
}
@test "Multi-character string without spaces" {
    actual=$(stringLength "lorem")
    assert_equal "$actual" "5"
}
@test "Multi-character string with spaces" {
    actual=$(stringLength "ipsum dolor")
    assert_equal "$actual" "11"
}
@test "Multi-chatacter string with only white-space characters" {
    mixed_ws=$' \t\n'
    actual=$(stringLength "$mixed_ws")
    assert_equal "$actual" "3"
}