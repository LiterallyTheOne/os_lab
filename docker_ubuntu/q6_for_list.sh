#! /bin/bash

h=("f1" "f2" "f3")

for r in ${h[@]}; do
    echo $r
done

echo ------

for r in s1 s2 s3; do
    echo $r
done

echo ------

for r in {1..3}; do
    echo $r
done

echo ------

for ((i = 0; i < 3; i++)); do
    echo $i
done

echo ------

h=({1..3})

echo ${h[1]}

for r in ${h[@]}; do
    echo $r

done

echo ------

h=(1 2 3 4)
h+=(5 6)

echo "${h[@]}"
