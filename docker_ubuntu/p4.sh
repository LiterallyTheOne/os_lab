if (($1 > $2)); then
    for ((i = 0; i < $1 - $2; i++)); do
        echo $3
    done
else

    if (($2 > $3)); then
        echo "$2 > $3"
    else
        echo "$2 <= $3"
    fi

fi
