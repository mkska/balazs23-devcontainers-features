#!/bin/bash
set -e

source dev-container-features-test-lib

check "specified bazelisk version" bash -c "bazelisk version | grep \"Bazelisk version: v1.14.0\""
# check "specified bazel version" bash -c "USE_BAZEL_VERSION=5.4.0 bazelisk version | grep \"Build label: 5.4.0\""
check "specified bazel version" bash -c "USE_BAZEL_VERSION=5.4.0 bazelisk version | grep \"Build label: 5.4.0\""

reportResults