#!/bin/bash
set -e

# npm version for Dev Container CLI
NX_VERSION=${VERSION:-"latest"}

# Clean up
rm -rf /var/lib/apt/lists/*

if [ "$(id -u)" -ne 0 ]; then
	echo -e 'Script must be run as root. Use sudo, su, or add "USER root" to your Dockerfile before running this script.'
	exit 1
fi

install_via_npm() {
    PACKAGE=$1
    echo "Installing npm package: $PACKAGE"
    npm install -g --omit=dev $PACKAGE
}

if [ "$NX_VERSION" != "none" ]; then
	if [ "$NX_VERSION" = "latest" ]; then
		npm_package="nx"
	else
		npm_package="nx@$NX_VERSION"
	fi
	install_via_npm ${npm_package}
fi

# Clean up
rm -rf /var/lib/apt/lists/*

echo "Done!"