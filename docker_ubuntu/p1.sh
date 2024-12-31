mkdir -p $2

for x in "$1"/*; do

    if $(echo $x | grep -q "r"); then
        cp -v $x "$2"/
    fi

done
