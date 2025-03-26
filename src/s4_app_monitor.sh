#!/bin/bash

apps=("s4_s1" "s4_s2")

for app in ${apps[@]}; do
    if ps aux | grep -v grep | grep -q $app; then
        echo "$app is running"

        cpu_usage=$(ps aux | grep $app | grep -v grep | awk '{print $3}')
        memory_usage=$(ps aux | grep $app | grep -v grep | awk '{print $4}')

        echo -e "\tcpu_usage: $cpu_usage"
        echo -e "\tmemory_usage: $memory_usage"

        if (($(echo "$cpu_usage > 2" | bc))); then
            echo -e "\tcpu usage is high"
        fi

    else
        echo "$app is not running"
    fi
done
