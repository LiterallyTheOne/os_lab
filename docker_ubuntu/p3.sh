counter=0

while IFS= read x; do

    if $(echo $x | grep -q "$2"); then
        counter=$((counter + 1))
    fi

done <$1

echo $counter
