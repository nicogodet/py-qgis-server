#!/bin/bash

set -e

PIP="pip3 install -U --user"

$PIP setuptools
$PIP -r requirements.pip
$PIP -r requirements.txt

pip3 install --user -e ./

export QGIS_DISABLE_MESSAGE_HOOKS=1
export QGIS_NO_OVERRIDE_IMPORT=1

# Add /.local to path
export PATH=$PATH:/.local/bin

# Run the server locally
echo "Running server..."
qgisserver -b 0.0.0.0 -p 8080 --timeout=3 --rootdir=$(pwd)/tests/data -w1



