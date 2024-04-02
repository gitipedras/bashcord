#!/bin/bash

# Define available channels (modify as needed)
channels=("general")

# Welcome message
echo "Welcome to Discord!"

# Username prompt
read -p "Enter Username: " username

echo "Logging in as [$username]"

# Action selection loop
while true; do
  # Clear previous output (optional)
  clear

  # Action menu
  #echo "What would you like to do?"
  watch -n 1 tail -n 10 general.txt
  echo -----------------------
  #echo "  1) View messages"
  echo "  2) Reply"
  echo "  3) Exit"

  # Read user choice
  read -p "Enter your choice (1-3): " choice

  case $choice in
    1)  # View messages
      # Channel selection loop
      while true; do
        clear
        echo "Select a channel to view messages:"
        select channel in "${channels[@]}"; do
          if [[ -f "$channel.txt" ]]; then
            # Display messages from the chosen file
            clear
            echo "Messages in #$channel:"
            watch -n 1 tail -n 10 general.txt #cat "$channel.txt"
            echo ""
            break  # Exit channel selection loop
          else
            echo "That channel does not exist."
          fi
        done

        # Prompt to go back to main menu
        read -p "Press Enter" exit_view
        if [[ -z "$exit_view" ]]; then
          break  # Exit channel selection loop
        fi
      done
      ;;
    2)  # Write message
      #clear
      #echo "Enter the channel to write to (general or tech):"
      #read channel

      channel="general"

      if [[ ! " ${channels[@]} " =~ " $channel " ]]; then
        echo "That channel does not exist."
        continue  # Skip to next iteration of the main loop
      fi

      echo "Enter your message:"
      read text

      # Construct final message
      final_text="${username}:${text}"

      # Append message to channel file
      echo "$final_text" >> "$channel.txt"
      echo "Message sent to #$channel!"
      ;;
    3)  # Exit
      echo "Goodbye!"
      exit 0;
      ;;
      *)  # Update Messages
      watch -n 1 tail -n 10 general.txt #cat "$channel.txt"
        ;;
  esac
done
