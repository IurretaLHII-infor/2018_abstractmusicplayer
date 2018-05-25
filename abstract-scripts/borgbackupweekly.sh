# Script to backup Abstract server data weekly
# Copyright (C) 2018 Ander Areitio, Leire Barainka and Borja Turiel for the Abstract Music Project - All Rights Reserved            # Permission to copy and modify is granted under the MIT license                                                                    
# Revisions:                                                                                                                        
# V1.0 -> Backup database, write a line for easier backup, and backup into /backup directory

#!/bin/sh

#Make a backup of mysql database, to save it alongside the backup
#Database name to backup
sqldbs=abstract
#Path to save backup
cpath=/mysqlbackup
#Host
mysqlhost=localhost
#Database username
username=root
#Database password
password=root
suffix=$(date +%d-%m-%Y)
        if [ -d $cpath ]
        then
                filler="just some action to prevent syntax error"
        else
                echo Creating $cpath
                mkdir -p $cpath
        fi

        mysqldump -c --user $username --password=$password $sqldbs  > ${cpath}/$sqldbs_$suffix.sql


#Add a blank line and a line to restore easier
sed -i "/Server version/a\\  \n-- Sartu gure datubasearen informazioa restauratu ahal izateko\nCREATE DATABASE IF NOT EXISTS abstract;\nUSE abstract;" ${cpath}/$sqldbs_$suffix.sql

#To restore, use:
#mysql -u $user -p < $path.sql


#Borg repository location
REPOSITORY=/backup

#Password of borg repository
export BORG_PASSPHRASE='$3gVr-k0714'

#Add the files we want to save, and save it with todays date
borg create -v --stats --progress --compression=lz4 --one-file-system                          \
	$REPOSITORY::'daily-abstract-{now:%Y-%m-%d}'    \
	/var/www/html                                    \
	/mysqlbackup					\

# Use the `prune` subcommand to maintain 7 daily, 4 weekly and 6 monthly
# archives of THIS machine. The '{hostname}-' prefix is very important to
# limit prune's operation to this machine's archives and not apply to
# other machine's archives also.
borg prune -v --list $REPOSITORY --prefix 'daily-{hostname}-' \
	    --keep-daily=7 --keep-weekly=4 --keep-monthly=6
#Ezabatu mysql backup-a egiteko sortu dugun karpeta
rm -r /mysqlbackup

#Copy backup to pendrive
cp -r /backup/* /mobilebackup

# borg delete $REPOSITORY::'{hostname}-'2017-06-18
