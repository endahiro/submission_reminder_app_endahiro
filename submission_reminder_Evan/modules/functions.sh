#!/bin/bash

# Function to read the submissions file and display unsubmitted students
check_submissions() {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

    # Skip the first line and loop through the rest
    while IFS=, read -r student assignment status; do
        # Clean up leading/trailing spaces
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        # If the assignment is unsubmitted, remind the user
        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted $ASSIGNMENT!"
        fi
    done < <(tail -n +2 "$submissions_file")  # Skip header row
}
