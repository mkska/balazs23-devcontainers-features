#!/bin/bash
set -e

# npm version for Dev Container CLI
NX_VERSION=${VERSION:-"latest"}

# Check user
if [ "$(id -u)" -ne 0 ]; then
	echo -e 'Script must be run as root. Use sudo, su, or add "USER root" to your Dockerfile before running this script.'
	exit 1
fi

command_exists() {
	command -v "$@" > /dev/null 2>&1
}

install_via_npm() {
    PACKAGE=$1
    echo "(*) Installing npm package: $PACKAGE"
    npm install -g --omit=dev $PACKAGE
}

# Check if npm is installed
if ! command_exists npm; then
    echo -e 'Feature requires npm to be installed. Please use a node-based image like:'
    echo -e ' - mcr.microsoft.com/vscode/devcontainers/typescript-node:${VARIANT}'
    echo -e 'You can also add as feature like:'
    echo -e ' - "ghcr.io/devcontainers/features/node:1": {}'
    exit 1
fi

if [ "$NX_VERSION" != "none" ]; then
	if [ "$NX_VERSION" = "latest" ]; then
		npm_package="nx"
	else
		npm_package="nx@$NX_VERSION"
	fi
	install_via_npm ${npm_package}
fi

echo "Done!"