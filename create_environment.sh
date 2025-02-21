#!/bin/bash

# Prompt the user for their name and store it in the variable
echo "Enter your name: "
read userName

# Define the main directory name based on the user's input
projectDir="submission_reminder_$userName"
echo "Creating main directory: $projectDir"
mkdir -p "$projectDir"

# Subdirectories to create inside the main directory
subdirs=("app" "modules" "assets" "config")
for dir in "${subdirs[@]}"; do
    echo "Creating subdirectory: $projectDir/$dir"
    mkdir -p "$projectDir/$dir"
done

# Create the required files in the respective subdirectories
files=("app/reminder.sh" "modules/functions.sh" "assets/submissions.txt" "config/config.env" "startup.sh")
for file in "${files[@]}"; do
    echo "Creating file: $projectDir/$file"
    touch "$projectDir/$file"
done

# Start populating the files with content

# Add content to reminder.sh
echo "#!/bin/bash

# Import the necessary configuration and functions
source ./config/config.env
source ./modules/functions.sh

# Define the path to the submissions file
submissions_file=\"./assets/submissions.txt\"

# Output the assignment and remaining days
echo \"Assignment: \$ASSIGNMENT\"
echo \"Days left for submission: \$DAYS_REMAINING\"
echo \"------------------------------------------\"

# Call the function to check for unsubmitted students
check_submissions \$submissions_file" > "$projectDir/app/reminder.sh"

# Make reminder.sh executable
chmod +x "$projectDir/app/reminder.sh"
echo "Made $projectDir/app/reminder.sh executable."

# Add content to functions.sh
echo "#!/bin/bash

# Function to read the submissions file and display unsubmitted students
check_submissions() {
    local submissions_file=\$1
    echo \"Checking submissions in \$submissions_file\"

    # Skip the first line and loop through the rest
    while IFS=, read -r student assignment status; do
        # Clean up leading/trailing spaces
        student=\$(echo \"\$student\" | xargs)
        assignment=\$(echo \"\$assignment\" | xargs)
        status=\$(echo \"\$status\" | xargs)

        # If the assignment is unsubmitted, remind the user
        if [[ \"\$assignment\" == \"\$ASSIGNMENT\" && \"\$status\" == \"not submitted\" ]]; then
            echo \"Reminder: \$student has not submitted \$ASSIGNMENT!\"
        fi
    done < <(tail -n +2 \"\$submissions_file\")  # Skip header row
}" > "$projectDir/modules/functions.sh"

# Populate submissions.txt with 15 student records
echo "student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
Bob, Shell Navigation, submitted
Alice, Git, not submitted
Charlie, Shell Basics, not submitted
David, Shell Navigation, submitted
Eve, JavaScript Basics, not submitted
Felix, Python Basics, submitted
Grace, CSS Flexbox, not submitted
Hank, Ruby Programming, submitted
Ivy, SQL Queries, not submitted
Jack, ReactJS, submitted
Karen, TypeScript, not submitted
Laura, MongoDB, submitted" > "$projectDir/assets/submissions.txt"

# Populate config.env with the configuration data
echo "ASSIGNMENT=\"Shell Navigation\"
DAYS_REMAINING=2" > "$projectDir/config/config.env"

# Add content to the startup.sh script
echo "#!/bin/bash

echo 'Starting the reminder application...'

# Check if reminder.sh exists and is executable
if [[ -x \"./app/reminder.sh\" ]]; then
    echo 'Running reminder script...'
    bash ./app/reminder.sh
else
    echo 'Error: reminder.sh is missing or not executable.'
    exit 1
fi" > "$projectDir/startup.sh"

# Make startup.sh executable
chmod +x "$projectDir/startup.sh"
echo "Made $projectDir/startup.sh executable."

# Final output with instructions for the user
echo ".................................................................................................." 
echo "To use the application, follow these steps:"
echo "1. Navigate to the project directory:"
echo "   cd $projectDir"
echo "2. Run the startup script:"
echo "   bash startup.sh"
