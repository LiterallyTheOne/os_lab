#! /bin/bash

h=("f1" "f2" "f3")

for r in "${h[@]}"; do
    echo $r
done

for r in s1 s2 s3; do
    echo $r
done

for r in {1..3}; do
    echo $r
done

for ((i = 0; i < 3; i++)); do
    echo $i
done

h=({1..3})

echo "${h[2]}"

for r in "${h[@]}"; do
    echo $r

done

h=(1 2 3 4)
h+=(5 6)

echo "${h[@]}"
