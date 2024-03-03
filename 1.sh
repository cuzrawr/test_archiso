#!/bin/bash

# Display dialog box to get user input
input=$(dialog --stdout --menu "Select an option:" 0 0 0 \
    1 "Command A" \
    2 "Command B" \
    3 "Command C" \
    4 "Custom Command")

# Check for the user's input and execute the appropriate command
case $? in
  0)  # OK button pressed
    case $input in
      "1") command_a ;;
      "2") command_b ;;
      "3") command_c ;;
      "4") input_custom=$(dialog --stdout --inputbox "Enter your custom command:" 0 0)
           command_custom "$input_custom" ;;
    esac
    ;;
  1)  # Cancel button pressed or ESC key
    echo "Cancelled."
    ;;
  255)  # Esc key pressed
    echo "ESC key pressed."
    ;;
esac
