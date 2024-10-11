#!/bin/bash
set -e

rm -rf ~/clock

sed -i '/\/clock\/\.venv\/bin\/python3 ~\/clock\/clock\.py/d' ~/.bashrc
