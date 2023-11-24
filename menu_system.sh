#!/bin/bash

# File to store records
records_file="records.txt"

# Function to display the main menu
display_menu() {
    clear
    echo "Record Management System"
    echo "1. Add a new record"
    echo "2. Edit existing records"
    echo "3. Search for specific records"
    echo "4. Generate reports"
    echo "5. Exit"
}

# Function to add a new record
add_record() {
    clear
    echo "Adding a new record..."
    read -p "Enter Name: " name
    read -p "Enter Age: " age
    echo -e "$name\t$age" >> "$records_file"
    echo "Record added successfully!"
    read -p "Press Enter to continue..." input
}

# Function to edit existing records
edit_records() {
    clear
    echo "Editing existing records..."
    echo "Current Records:"
    cat "$records_file"
    read -p "Enter the line number to edit: " line_number
    read -p "Enter updated Name: " updated_name
    read -p "Enter updated Age: " updated_age
    sed -i "${line_number}s/.*/$updated_name\t$updated_age/" "$records_file"
    echo "Record $line_number edited successfully!"
    read -p "Press Enter to continue..." input
}

# Function to search for specific records
search_records() {
    clear
    echo "Searching for specific records..."
    read -p "Enter Name or Age to search: " search_term
    grep -i "$search_term" "$records_file"
    read -p "Press Enter to continue..." input
}

# Function to generate reports
generate_reports() {
    clear
    echo "Generating reports..."
    echo "Sample report: Total records - $(wc -l < "$records_file")"
    cat "$records_file"
    read -p "Press Enter to continue..." input
}

# Check if records file exists, if not create it
if [[ ! -e "$records_file" ]]; then
    touch "$records_file"
fi

# Main script logic
while true; do
    display_menu

    read -p "Enter your choice (1-5): " choice
    case $choice in
        1) add_record ;;
        2) edit_records ;;
        3) search_records ;;
        4) generate_reports ;;
        5) echo "Exiting..."; break ;;
        *) echo "Invalid choice. Please enter a valid option." ;;
    esac
done
