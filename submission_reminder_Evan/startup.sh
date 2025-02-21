#!/bin/bash

echo 'Starting the reminder application...'

# Check if reminder.sh exists and is executable
if [[ -x "./app/reminder.sh" ]]; then
    echo 'Running reminder script...'
    bash ./app/reminder.sh
else
    echo 'Error: reminder.sh is missing or not executable.'
    exit 1
fi
