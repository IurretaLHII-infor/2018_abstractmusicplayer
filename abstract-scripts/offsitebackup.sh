# Script to get the backup from the Abstract Server
# Copyright (C) 2018 Ander Areitio, Leire Barainka and Borja Turiel for the Abstract Music Project - All Rights Reserved            
# Permission to copy and modify is granted under the MIT license                                                                    
# Revisions:                                                                                                                        
# V1.0 -> Copy directory to localhost

#!/bin/sh

#Copy the directory to localhost
scp -r  abstract:/offsitebackup/* /abstractbackup

#Remove the lock file
rm /abstractbackup/lock

