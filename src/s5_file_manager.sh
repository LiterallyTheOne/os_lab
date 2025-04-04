#!/bin/bash

create_directory() {
    read -p "Enter directory name: " dir_name
    mkdir "$dir_name"
    echo "Directory '$dir_name' created."
}

list_files() {
    read -p "Enter directory name: " dir_name
    if [ -d "$dir_name" ]; then
        echo "Files in '$dir_name':"
        ls "$dir_name"
    else
        echo "Directory '$dir_name' does not exist."
    fi
}

create_file() {
    read -p "Enter file name: " file_name
    touch "$file_name"
    echo "File '$file_name' created."
}

write_to_file() {
    read -p "Enter file name: " file_name
    read -p "Enter text to write to file: " text
    echo "$text" >"$file_name"
    echo "Text written to '$file_name'."
}

read_file() {
    read -p "Enter file name: " file_name
    if [ -f "$file_name" ]; then
        echo "Contents of '$file_name':"
        cat "$file_name"
    else
        echo "File '$file_name' does not exist."
    fi
}

delete_file() {
    read -p "Enter file name: " file_name
    if [ -f "$file_name" ]; then
        rm "$file_name"
        echo "File '$file_name' deleted."
    else
        echo "File '$file_name' does not exist."
    fi
}

while true; do

    echo "1) Create directory"
    echo "2) List Files in Directory"
    echo "3) Create File"
    echo "4) Write to File"
    echo "5) Read File"
    echo "6) Delete File"
    echo "7) Exit"
    read -p "Enter the number: " choice

    case $choice in
    1)
        create_directory
        ;;
    2)
        list_files
        ;;
    3)
        create_file
        ;;
    4)
        write_to_file
        ;;
    5)
        read_file
        ;;
    6)
        delete_file
        ;;
    7)
        echo "Exiting..."
        exit 0
        ;;
    *)
        echo "Invalid choice. Please try again."
        ;;
    esac

    echo "--------------------------------"

done
