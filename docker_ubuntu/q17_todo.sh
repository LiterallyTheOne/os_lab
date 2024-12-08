FILE_NAME="todo.txt"

if [ $# -gt 0 ]; then
    FILE_NAME=$1
fi

if [ ! -f "$FILE_NAME" ]; then
    echo "File not found: $FILE_NAME"
    touch "$FILE_NAME"
fi

show_menu() {
    echo "Menu:"
    echo "1. Add task"
    echo "2. View tasks"
    echo "3. Delete task"
    echo "4. Exit"
}

add_task() {
    read -p "Enter task: " task
    echo "$task" >>$FILE_NAME
    echo "Task added successfully."
}

view_tasks() {
    cat $FILE_NAME
}

delete_task() {
    read -p "Enter task number to delete: " task_number
    sed -i "${task_number}d" $FILE_NAME
    echo "Task deleted successfully."
}

exit_program() {
    echo "Exiting program..."
    exit 0
}

while true; do
    show_menu
    read -p "Enter your choice: " choice

    case $choice in
    1)
        add_task
        ;;
    2)
        view_tasks
        ;;
    3)
        delete_task
        ;;
    4)
        exit_program
        ;;
    *)
        echo "Invalid choice. Please try again."
        ;;
    esac
done
