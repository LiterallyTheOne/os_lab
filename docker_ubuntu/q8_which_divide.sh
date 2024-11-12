#! /bin/bash

for i in {2..9}; do
    if [ $(("$1" % i)) -eq 0 ]; then
        echo $i
    fi
done
