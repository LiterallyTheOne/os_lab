#! /bin/bash
dir_name="backup_$(date +%Y%m%d_%H%M%S)"
mkdir $dir_name
cp -r ../example_dir $dir_name
