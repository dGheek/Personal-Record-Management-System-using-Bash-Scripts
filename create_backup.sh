#!/bin/bash

# File to store records and backups
records_file="records.txt"
backup_dir="backups"

# Check if records file exists, if not create it
if [[ ! -e "$records_file" ]]; then
    touch "$records_file"
fi

# Check if backups directory exists, if not create it
if [[ ! -d "$backup_dir" ]]; then
    mkdir -p "$backup_dir"
fi

# Function to create backup of records file
create_backup() {
    local timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
    local backup_file="$backup_dir/records_backup_$timestamp.txt"
    cp "$records_file" "$backup_file"
    echo "Backup created: $backup_file"
}

# Main script logic
create_backup
