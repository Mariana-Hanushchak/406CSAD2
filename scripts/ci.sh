#!/bin/sh
set -eu
python3 -m venv .venv
.venv/bin/python -m pip install --upgrade pip
.venv/bin/pip install -r requirements.txt
.venv/bin/pytest -v
.venv/bin/python src/app.py
