#! /bin/bash

target_dir="backup-$(date +%Y-%m-%d-%H-%M-%S)"

mkdir $target_dir

cp -r d1 $target_dir

echo "done"
