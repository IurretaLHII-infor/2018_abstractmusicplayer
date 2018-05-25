# Script to save the backup offsite, using ssh keys
# Copyright (C) 2018 Ander Areitio, Leire Barainka and Borja Turiel for the Abstract Music Project - All Rights Reserved
# Permission to copy and modify is granted under the MIT license                                                                
# Revisions:                                                                                                                        
# V1.0 -> Copy the directory to another location to copy it from an offsite place

#!/bin/sh

#File to serve as control
file=lock
#Directory to copy
directory=/offsitebackup
#Full path
path="${directory}/${file}"
#User for permission
user="abstractbackup"
#Group for permission
group="abstractbackup"

#Copy backup directory to another location

cp -r /backup $directory

touch $path

chmod 700 $directory

chown -R $user:$group $directory

while [ -f $path ]
do
	#If file exists, wait
	echo "File exists, waiting..."
	sleep 5
done
echo "Removing directory"
#When the file no longer exists, delete directory
rm -r $directory
