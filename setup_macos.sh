#!/bin/bash

BASEDIR=$(dirname $0)
cd $BASEDIR

source ./utils.sh

echo "installing MacOS packages..."

e_newline
e_header 'Install Rye'
curl -sSf https://rye-up.com/get | bash
