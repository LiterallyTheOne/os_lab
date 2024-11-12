#! /bin/bash

r_sum=0

for r in $@; do
    # r_sum=$((r_sum + r))
    let r_sum+=r
done

echo $r_sum
