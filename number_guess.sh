#!/bin/bash

# Function to display the main menu
display_menu() {
    echo "Welcome to Interactive Script"
    echo "1. Enter your name"
    echo "2. Guess a number"
    echo "3. Exit"
}

# Function to prompt for the user's name
enter_name() {
    read -p "Enter your name: " username
    echo "Hello, $username!"
    read -p "Press Enter to continue..." input
}

# Function to play a number guessing game
guess_number() {
    secret_number=$((RANDOM % 10 + 1))  # Random number between 1 and 10
    attempts=3

    echo "Guess the secret number (between 1 and 10)"
    while [[ $attempts -gt 0 ]]; do
        read -p "Enter your guess: " user_guess

        if [[ ! $user_guess =~ ^[1-9]$ && $user_guess -ne 10 ]]; then
            echo "Please enter a valid number between 1 and 10."
            continue
        fi

        if [[ $user_guess -eq $secret_number ]]; then
            echo "Congratulations! You guessed the correct number: $secret_number"
            break
        elif [[ $user_guess -lt $secret_number ]]; then
            echo "Try a higher number. You have $((attempts - 1)) attempts left."
        else
            echo "Try a lower number. You have $((attempts - 1)) attempts left."
        fi

        ((attempts--))
    done

    if [[ $attempts -eq 0 ]]; then
        echo "Sorry, you've run out of attempts. The secret number was $secret_number"
    fi

    read -p "Press Enter to continue..." input
}


# Main script logic
while true; do
    clear
    display_menu

    read -p "Enter your choice (1-3): " choice
    case $choice in
        1) enter_name ;;
        2) guess_number ;;
        3) echo "Exiting..."; break ;;
        *) echo "Invalid choice. Please enter a valid option." ;;
    esac
done
