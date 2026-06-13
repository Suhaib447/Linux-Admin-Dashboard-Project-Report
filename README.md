Linux Admin Dashboard Project
Project Overview
This project is a Linux-based terminal dashboard built using Bash scripting.
It provides a menu-driven interface for performing common Linux system administration tasks such as system monitoring, user management, file operations, log analysis, backup creation, and report generation.
The project demonstrates practical usage of Linux commands and shell scripting for system administration tasks.

 Features
1. System Information
•	Displays hostname
•	Shows current user
•	Shows system uptime
•	Displays memory usage
•	Displays disk usage
2. Users and Groups
•	List system users
•	Show current user groups
•	Show logged-in users
•	Count total system users
3. File Management
•	Search for files
•	Count files in a directory
•	Show directory size
•	Create files
•	Delete files
4. Permission Audit
•	Check file permissions
•	Find files with 777 permissions
5. Log Analysis
•	View last system logs
•	Search logs by keyword
6. Backup System
•	Create compressed backups of directories using tar
7. Report Generation
•	Generates system report including:
o	Date
o	User
o	Hostname
o	Uptime
o	Memory usage
o	Disk usage

 Technologies Used
•	Bash Scripting
•	Linux OS (Ubuntu)
•	Linux Command Line Tools:
o	find
o	grep
o	tar
o	chmod
o	who
o	df
o	free

How to Run
chmod +x linux_dashboard.sh
./linux_dashboard.sh

 Project Structure
linux-dashboard/
│
├── linux_dashboard.sh
├── system_report.txt
├── backup_*.tar.gz
└── README.md

Learning Outcomes
•	Linux system administration basics
•	Bash scripting logic and structure
•	File and process management
•	Log analysis techniques
•	Automation of admin tasks

 Author
Developed as a Linux final project demonstrating system administration skills using Bash scripting.

