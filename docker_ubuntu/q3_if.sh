#! /bin/bash

if [ $1 -gt $2 ]; then
    echo "greater"
elif [ $1 -eq $2 ]; then
    echo "equal"
else
    echo "lesser"
fi

# if (($1 > $2)); then
#     echo "greater"
# elif (($1 == $2)); then
#     echo "equal"
# else
#     echo "lesser"
# fi
