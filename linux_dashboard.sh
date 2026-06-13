#!/bin/bash

while true
do
    clear

    echo "================================="
    echo "      Linux Admin Dashboard"
    echo "================================="
    echo
    echo "1. System Information"
    echo "2. Users and Groups"
    echo "3. File Management"
    echo "4. Permission Audit"
    echo "5. Log Analysis"
    echo "6. Backup System"
    echo "7. Generate Report"
    echo "8. Exit"
    echo

    read -p "Choose an option: " choice

    case $choice in
       1)
    echo
    echo "===== System Information ====="
    echo

    echo "Hostname:"
    hostname

    echo
    echo "Current User:"
    whoami

    echo
    echo "Uptime:"
    uptime -p

    echo
    echo "Memory Usage:"
    free -h

    echo
    echo "Disk Usage:"
    df -h
    ;;
      2)
    while true
    do
        clear

        echo "===== Users and Groups ====="
        echo
        echo "1. List Users"
        echo "2. Show Current User Groups"
        echo "3. Show Logged-in Users"
        echo "4. Count System Users"
        echo "5. Return to Main Menu"

        echo

        read -p "Choose an option: " user_choice

        case $user_choice in
    1)
        echo
        echo "System Users:"
        cut -d: -f1 /etc/passwd
        ;;
    2)
        echo
        echo "Current User Groups:"
        groups
        ;;
    3)
        echo
        echo "Logged-in Users:"
        who
        ;;
    4)
        echo
        echo "Total Number of Users:"
        cut -d: -f1 /etc/passwd | wc -l
        ;;
    5)
        break
        ;;
            *)
                echo "Invalid option"
                ;;
        esac

        echo
        read -p "Press Enter to continue..."
    done
    ;;
       3)
    while true
    do
        clear

        echo "===== File Management ====="
        echo
        echo "1. Search for a File"
        echo "2. Count Files in a Directory"
        echo "3. Show Directory Size"
        echo "4. Create File"
        echo "5. Delete File"
        echo "6. Return to Main Menu"
        echo

        read -p "Choose an option: " file_choice

        case $file_choice in
            1)
                read -p "Enter filename to search: " filename
                find . -name "$filename"
                ;;
            2)
                read -p "Enter directory path: " dir
                find "$dir" -type f | wc -l
                ;;
           3)
    read -p "Enter directory path: " dir
    du -sh "$dir"
    ;;
4)
    read -p "Enter filename to create: " filename
    touch "$filename"
    echo "File created successfully."
    ;;
5)
    read -p "Enter filename to delete: " filename
    rm -i "$filename"
    ;;
6)
    break
    ;;
            *)
                echo "Invalid option"
                ;;
        esac

        echo
        read -p "Press Enter to continue..."
    done
    ;;
       4)
    while true
    do
        clear

        echo "===== Permission Audit ====="
        echo
        echo "1. Check Permissions of a File"
        echo "2. Find Files with 777 Permissions"
        echo "3. Return to Main Menu"
        echo

        read -p "Choose an option: " perm_choice

        case $perm_choice in
            1)
                read -p "Enter file path: " filepath
                ls -l "$filepath"
                ;;
            2)
                echo
                echo "Searching..."
                find . -type f -perm 777
                ;;
            3)
                break
                ;;
            *)
                echo "Invalid option"
                ;;
        esac

        echo
        read -p "Press Enter to continue..."
    done
    ;;
       5)
    while true
    do
        clear

        echo "===== Log Analysis ====="
        echo
        echo "1. View Last 20 Lines of Syslog"
        echo "2. Search Keyword in Syslog"
        echo "3. Return to Main Menu"
        echo

        read -p "Choose an option: " log_choice

        case $log_choice in
            1)
                echo

                if [ -f /var/log/syslog ]; then
                    sudo tail -20 /var/log/syslog
                else
                    echo "syslog file not found."
                fi
                ;;
            2)
                read -p "Enter keyword: " keyword

                if [ -f /var/log/syslog ]; then
                    sudo grep -i "$keyword" /var/log/syslog
                else
                    echo "syslog file not found."
                fi
                ;;
            3)
                break
                ;;
            *)
                echo "Invalid option"
                ;;
        esac

        echo
        read -p "Press Enter to continue..."
    done
    ;;
       6)
    while true
    do
        clear

        echo "===== Backup System ====="
        echo
        echo "1. Create Backup"
        echo "2. Return to Main Menu"
        echo

        read -p "Choose an option: " backup_choice

        case $backup_choice in
            1)
                read -p "Enter directory to backup: " dir

                if [ -d "$dir" ]; then
                    backup_name="backup_$(date +%Y%m%d_%H%M%S).tar.gz"

                    tar -czf "$backup_name" "$dir"

                    echo
                    echo "Backup created successfully:"
                    echo "$backup_name"
                else
                    echo "Directory not found."
                fi
                ;;
            2)
                break
                ;;
            *)
                echo "Invalid option"
                ;;
        esac

        echo
        read -p "Press Enter to continue..."
    done
    ;;
       7)
    report_file="system_report.txt"

    {
        echo "================================="
        echo " Linux System Report"
        echo "================================="
        echo
        echo "Date:"
        date
        echo
        echo "Current User:"
        whoami
        echo
        echo "Hostname:"
        hostname
        echo
        echo "Uptime:"
        uptime -p
        echo
        echo "Memory Usage:"
        free -h
        echo
        echo "Disk Usage:"
        df -h
    } > "$report_file"

    echo
    echo "Report generated successfully:"
    echo "$report_file"
    ;;
        8) exit;;
        *) echo "Invalid option";;
    esac

    echo
    read -p "Press Enter to continue..."
done

