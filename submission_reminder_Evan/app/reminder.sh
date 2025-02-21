#!/bin/bash

# Import the necessary configuration and functions
source ./config/config.env
source ./modules/functions.sh

# Define the path to the submissions file
submissions_file="./assets/submissions.txt"

# Output the assignment and remaining days
echo "Assignment: $ASSIGNMENT"
echo "Days left for submission: $DAYS_REMAINING"
echo "------------------------------------------"

# Call the function to check for unsubmitted students
check_submissions $submissions_file
