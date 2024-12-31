while true; do

    read x
    if [ -f $x ]; then
        echo "$x is a file"
        echo "$(ls -l $x)"

    elif [ -d $x ]; then
        echo "$x is a directory"
        echo "$(ls -l $x)"

    else
        echo "$x is not a file or a directory"

    fi

done
