#!/bin/bash

# Function to generate a random password
generate_password() {
    local length=${1:-12}  # Default password length is 12 characters
    local password=$(openssl rand -base64 "$((length * 3 / 4))" | tr -d '+/' | cut -c1-"$length")
    echo "$password"
}

# Prompt user for password length
read -p "Enter password length (default is 12): " pass_length

# Check if input is a number, otherwise, default to 12
if [[ $pass_length =~ ^[0-9]+$ ]]; then
    password=$(generate_password "$pass_length")
else
    echo "Invalid input. Using default password length (12)."
    password=$(generate_password)
fi

echo "Generated password: $password"
