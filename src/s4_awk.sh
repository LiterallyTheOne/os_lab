#!/bin/bash

echo "s1 s2 s3" | awk '{print $2}'

echo "**************"

ps | awk '{print $2, $3}'

echo "**************"

echo -e "BTC 89.12\nETH 42\nDOGE 1.25" | awk '$2 > 30'

echo -e "BTC 89.12\nETH 42\nDOGE 1.25" | awk '$2 > 30 {print $1}'

echo "**************"

ps -ef | awk '$4 > 2 {print $1, $4, $8}'
