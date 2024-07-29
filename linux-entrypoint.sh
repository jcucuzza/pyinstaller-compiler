#!/bin/sh
cd /app

python3 --version
pip3 --version

pip3 install -r requirements.txt --break-system-packages

sh -c "$@"
