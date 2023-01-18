#!/bin/bash

# test without option, using latest default value
set -e

source dev-container-features-test-lib

# check "nx --version" bash -c "npm info nx version"
check "nx --version" bash -c "nx init --version"

reportResults