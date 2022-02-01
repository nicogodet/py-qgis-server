#!/bin/bash

set -e

VENV_PATH=/.local/venv

PIP="$VENV_PATH/bin/pip"
PIP_INSTALL="$VENV_PATH/bin/pip install -U"

echo "-- Creating virtualenv"
python3 -m venv --system-site-packages $VENV_PATH

echo "-- Installing required packages..."
$PIP_INSTALL -q pip setuptools wheel
$PIP_INSTALL -q --prefer-binary -r requirements.txt

$PIP install -e ./

if [ -e /amqp_src ]; then
    $PIP install -e /amqp_src/
fi

# Run the server locally
echo "Running server..."
$VENV_PATH/bin/qgisserver -b 0.0.0.0 -p 8080 --proxy -j1



