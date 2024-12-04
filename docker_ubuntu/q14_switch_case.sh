echo "Enter a number between [1-3]: "
read num
case $num in
[1-3])
    echo "${num}*2=$((num * 2))"
    ;;
*)
    echo "Invalid number"
    ;;
esac
