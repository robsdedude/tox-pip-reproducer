#!/usr/bin/env bash

mkdir -p out

echo "Running tox1"
python3 -m tox -c tox1.ini -rvv -e py37-unit > out/tox1.out 2>&1 && echo "tox1.ini passed" || echo "tox1.ini failed"

echo -e "\nRunning tox2"
python3 -m tox -c tox2.ini -rvv -e py37-unit > out/tox2.out 2>&1 && echo "tox2.ini passed" || echo "tox2.ini failed"

echo -e "\nRunning tox3"
python3 -m tox -c tox3.ini -rvv -e py37-unit > out/tox3.out 2>&1 && echo "tox3.ini passed" || echo "tox3.ini failed"
