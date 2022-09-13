#!/bin/bash

# Check if we are root privilage or not
if [ "$UID" -ne 0 ]
then
    echo "Please run as root"
    exit 3
fi

# Which files are we going to back up. Please make sure to exist /home/ec2-user/data file

backup_files="/home/ec2-user/data /home/ec2-user/myfolder"

# Where do we backup to. Please crete this file before execute this script

dest="/mnt/backup"

# Create archive filename based on time

time=$(date +"%Y_%m_%d_%H_%M")
hostname=$(hostname -s)
archive_file="$hostname-$time.tgz"

# Print start status message.

echo "archive process is started"

# Backup the files using tar.

tar -czvf $dest/$archive_file $backup_files

# Print end status message.

echo "backup is finished"

# Long listing of files in $dest to check file sizes.
ls -l /mnt/backup