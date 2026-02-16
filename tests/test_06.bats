setup() {
    load 'test_helper.bash'
    load_libraries
    # Source the script so we can access the ftc function directly
    # Note: Ensure your script doesn't execute main if being sourced
    source ./06_fahrenheit_to_celsius/solution.sh
}

# --- UNIT TESTS (Testing the Logic) ---
@test "ftc: converts boiling point" {
    # Call the function directly without running the whole script
    result=$(ftc 212)
    [ "$result" == "100.00" ]
}

@test "ftc: converts freezing point" {
    result=$(ftc 32)
    [ "$result" == "0.00" ]
}

# --- INTEGRATION TESTS (Testing the Script Output) ---
@test "script: returns verbose output for 80F" {
    run ./06_fahrenheit_to_celsius/solution.sh 80
    assert_success
    # This tests your FIRST version of main (the verbose one)
    assert_output "80 fahrenheit degrees = 26.67 celsius degrees"
}