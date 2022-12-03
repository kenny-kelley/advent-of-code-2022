#!/bin/bash

# Advent of Code 2022
# Author: Kenny Kelley
# Date: 2022-12-03


for solution in ./day_*/main.rb; do
    echo "================================================================================"
    ${solution}
    echo
done
