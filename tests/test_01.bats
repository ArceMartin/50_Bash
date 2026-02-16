setup() {
    load 'test_helper.bash'
    load_libraries
}

@test "can run our script" {
    run ./01_hello_world/solution.sh
    assert_output 'Hello, World!'
}