LOG_FILE="../example_dir/todo.txt"

if [ ! -f $LOG_FILE ]; then
    touch $LOG_FILE
fi

if [ $# -lt 1 ]; then
    echo "[show|add|remove]"
    exit 1
fi

if [ $1 == "show" ]; then
    cat $LOG_FILE
elif [ $1 == "add" ]; then
    echo $2 >>$LOG_FILE
elif [ $1 == "remove" ]; then
    grep -v $2 $LOG_FILE >$LOG_FILE.tmp
    mv $LOG_FILE.tmp $LOG_FILE
else
    echo "[show|add|remove]"
    exit 1
fi
