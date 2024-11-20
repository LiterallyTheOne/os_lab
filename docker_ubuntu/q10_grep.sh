for r in d1/*; do

    if $(echo "$r" | grep -q "f1"); then
        echo "$r"
    fi

done
