# define the base directory for helpers
BATS_HELPER_DIR="$HOME/src"

# Load helpers with a simple helper function
load_libraries() {
    load "${BATS_HELPER_DIR}/bats-support/load.bash"
    load "${BATS_HELPER_DIR}/bats-assert/load.bash"
}