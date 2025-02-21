  GNU nano 6.3                                                              README.md
Submission Reminder App
Overview
The Submission Reminder App is a simple yet effective tool to help educators keep track of assignment submissions. This lightweight shell script application automates the process of checking students' submission statuses and reminds those who haven't completed their assignments. It’s easy to use, fully customizable, and designed to streamline the task of tracking submission deadlines.

Features:
Automated Reminders: Effortlessly sends reminders to students who haven’t submitted their assignments.
Easy Configuration: The config.env file allows you to easily modify assignment details and deadlines.
Quick Setup: Run the create_environment.sh script to set up the required files and directories.
Flexible: Designed to handle multiple students and assignments, perfect for small to medium-sized classes.
How It Works:
The app fetches assignment details (such as the name and deadline) from the config.env file.
It checks submissions.txt for student records and finds those who have yet to submit their work.
It then prints out reminders for each student who hasn’t submitted their assignment.
Installation & Setup
Requirements:
A Linux-based operating system (or WSL for Windows users).
Bash shell.
Git (optional, for cloning the repository).
Steps:
Clone the Repository:
First, clone the repository to your local machine:
git clone https://github.com/endahiro/submission_reminder_app_endahiro.git

Enter the Project Directory:
Navigate to the project directory:
cd submission_reminder_app_endahiro

Run the Setup Script:
Execute the create_environment.sh script to set up the necessary environment:
bash create_environment.sh

You'll be prompted to enter your name, which will create a directory named submission_reminder_yourName.
Go to the Created Directory:
Change to the newly created directory:
cd submission_reminder_yourName

Launch the App:
Start the app by running the startup.sh script:
bash startup.sh

View the Output:
The app will output the assignment details and a list of students who have not yet submitted their assignments.

Project Structure
The repository contains the following files and directories:

create_environment.sh: Setup script to initialize the app.
README.md: This file, providing instructions and information about the project.
submission_reminder_yourName/: The directory created by the setup script, which contains:
app/reminder.sh: Main script for checking and reminding submissions.
modules/functions.sh: Helper functions.
assets/submissions.txt: A file containing the student submission records.
config/config.env: Configuration file for assignment details.
startup.sh: Script to launch the app.
Example Output
When you run the application, the output will look like this:

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Starting the reminder app...

Running the reminder script...
Assignment: Shell Navigation
Days remaining: 2 days
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Checking submissions in ./assets/submissions.txt
⚠️ Reminder: Chinemerem has not submitted the Shell Navigation assignment!
⚠️ Reminder: Divine has not submitted the Shell Navigation assignment!
⚠️ Reminder: Grace has not submitted the Shell Navigation assignment!
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Customization
You can easily customize the app to suit your needs:

Add More Students: Edit the submissions.txt file to include more students.
Update Assignment Details: Modify the config.env file to change the assignment name or deadline.
Extend Features: Adjust reminder.sh and functions.sh to add new functionalities.
Contributing
We welcome contributions! Feel free to fork the repository, make your changes, and submit a pull request. Please ensure your code aligns with the existing style and includes proper documentation.

License
This project is open-source and distributed under the MIT License. See the LICENSE file for more information.

Contact
If you have any questions or feedback, reach out to:

Name: Evan Ndahiro
Email: e.ndahiro@alustudent.com
GitHub: endahiro
