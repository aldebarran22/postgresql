#!/bin/bash

PG_NOMBRE_INSTANCIA=$(basename ${PGDATA})
SCRIPT_ARCHIVE_COMMAND=$(basename $0)
# Data partition used by PostgreSQL 
PG_DATA_PARTITION="${PGDATA}"
# Partitition used by PostgreSQL to save WAL files
PG_ARCH_PARTITION="${PGDATA}/pg_wal"
#PG_LOG_PARTITION="${PG_ARCH_PARTITION}"
PG_LOG_PARTITION="${PGDATA}/log"
# Backup  partition for our postgresql cluster
PG_BACKUP_PARTITION="/home/postgres/curso/wal/${PG_NOMBRE_INSTANCIA}"
# Directory for PITR base backups 
PG_BACKUP_PITR_DATA=${PG_BACKUP_PARTITION}
# Directory used to take a backup of the WAL generated
PG_BACKUP_PITR_WAL=${PG_BACKUP_PARTITION}

VERSION="2.0 (5.2 modificada)"

NO_ARGS=0 
E_OPTERROR=65
FORCE=0
DATE_TIME=$(date "+%x %X")


# ########################################
# ########################################
# Function check_partition()
# 
# Check if $PG_BACKUP_PITR_WAL and 
# $PG_ARCH_PARTITION exists.
#
# Script is aborted if they do not exist.
#
# ########################################
# ########################################

check_partitions(){

    if [ ! -d $PG_BACKUP_PITR_WAL ]; then
		echo "$DATE_TIME ERROR: $PG_BACKUP_PITR_WAL does not exist. $SCRIPT_ARCHIVE_COMMAND can not archive the WAL file $WAL_FILE under $PG_BACKUP_PITR_WAL." >> $PG_LOG_PARTITION/$LOG_FILE
	    exit 1
	fi
	
    if [ ! -d $PG_ARCH_PARTITION ]; then
		echo "$DATE_TIME ERROR: $PG_ARCH_PARTITION does not exist. $SCRIPT_ARCHIVE_COMMAND can not read the WAL file $WAL_FILE to be archived." >> $PG_LOG_PARTITION/$LOG_FILE
		exit 1
    fi
}


# ########################################
# ########################################
#
# Function check_wal_file()
#
# Checks if the file to be copied to 
# PITR_wal exists. We exit the script with 
# a non-zero value (error) if it does.
#
# ########################################
# ########################################

check_wal_file(){
    
    if [ -f "$PG_BACKUP_PITR_WAL/$WAL_FILE" ]; then
		echo "$DATE_TIME ERROR: WAL $WAL_FILE already exist under $PG_BACKUP_PITR_WAL. $SCRIPT_ARCHIVE_COMMAND refuses to overwrite this file to preserve the integrity of your archive." >> $PG_LOG_PARTITION/$LOG_FILE
		echo "This is a serious error that should not happen. You should investigate the cause (probably a bug or an administrator error) and fix it." >> $PG_LOG_PARTITION/$LOG_FILE
	
		if [ -f "${PG_ARCH_PARTITION}/archive_status/${WAL_FILE}.done" ] && [ -f "${PG_ARCH_PARTITION}/archive_status/${WAL_FILE}.ready" ]; then
			
			if rm -f ${PG_ARCH_PARTITION}/archive_status/${WAL_FILE}.ready
			then
				echo "$DATE_TIME ERROR: ${PG_ARCH_PARTITION}/archive_status/${WAL_FILE}.done and ${PG_ARCH_PARTITION}/archive_status/${WAL_FILE}.ready exist at the same time." >> $PG_LOG_PARTITION/$LOG_FILE
				echo "This should not happen, probably an OS or postgresql bug." >> $PG_LOG_PARTITION/$LOG_FILE
				echo "$DATE_TIME ${PG_ARCH_PARTITION}/archive_status/${WAL_FILE}.ready has been deleted." >> $PG_LOG_PARTITION/$LOG_FILE
			else
				echo "$DATE_TIME ERROR: ${PG_ARCH_PARTITION}/archive_status/${WAL_FILE}.done and ${PG_ARCH_PARTITION}/archive_status/${WAL_FILE}.ready exist at the same time." >> $PG_LOG_PARTITION/$LOG_FILE
				echo "This should not happen, probably an OS or postgresql bug." >> $PG_LOG_PARTITION/$LOG_FILE
				echo "$DATE_TIME ${PG_ARCH_PARTITION}/archive_status/${WAL_FILE}.ready could not be deleted." >> $PG_LOG_PARTITION/$LOG_FILE
			fi
			echo
		fi
	
	    exit 1
    fi
}


# ########################################
# ########################################
#
# Function archive_wal()
#
# It will try to copy a wal file to the 
# PG_BACKUP_PITR_WAL. It returns a non-zero 
# value if error
# 
# ########################################
# ########################################

archive_wal(){
	cp -dp $ABSOLUTE_PATH $PG_BACKUP_PITR_WAL/$WAL_FILE
    if [ -f "$PG_BACKUP_PITR_WAL/$WAL_FILE" ]
	then
#original, replicacion en PG9.6 no admite solo lectura		chmod 440 $PG_BACKUP_PITR_WAL/$WAL_FILE
		chmod 640 $PG_BACKUP_PITR_WAL/$WAL_FILE
	else
		echo "$DATE_TIME ERROR - WAL $WAL_FILE could not be archived under $PG_BACKUP_PITR_WAL. The directory $PG_ARCH_PARTITION will continue to fill with WAL segment files not archived until the situation is resolved." >> $PG_LOG_PARTITION/$LOG_FILE
		exit 1
    fi
}


# ########################################
# ########################################
# MAIN
# ########################################
# ########################################

help(){

    echo
    echo "Script: $0" 
    echo "Version: ${VERSION}"
    
    echo "
Description: This script is used by postgresql.conf:archive_command to archive
             WAL files to pg_bck/PITR_wal "

    echo 
    echo "Usage: "
    echo "       `basename $0` [-v][-h][-P Absolute path of WAL][-F WAL Filename][-S service_hostname]"
    echo 
    echo "       -h Help"
    echo "       -v Version"
    echo "       -P Absolute path of WAL to archive (*)"
    echo "       -F WAL Filename to archive (*)"
    echo "       -S Hostname/SG package running postgreSQL (*)"
    echo
    echo "       (*) - Must be defined"
    echo
    echo "Example: archive_command = '$0 -P %p -F %f -S dbpg-example'"
    echo 
}


# ########################################
# ########################################
# Script invoked with no command-line args?
# ########################################
# ########################################
if [ $# -eq "$NO_ARGS" ]
    then
    help
    exit $E_OPTERROR   
fi  


# ########################################
# ########################################
# Getting command options
# ########################################
# ########################################
while getopts "hvP:F:S:" Option
  do
  case $Option in
      h) 
	  help
	  exit 0;;
    
      v)
	  echo
	  echo " Name: `basename $0`"
	  echo " Version: $VERSION"
	  echo " Description: Archive WAL files script"
	  echo " Contact: sistemas.bd@soporte.sgai.csic.es"
	  echo
	  exit;;
    
      P)
    ABSOLUTE_PATH=$OPTARG;;
  
      F)
    WAL_FILE=$OPTARG;;
    
      S) 
    SERVICE_HOSTNAME=$OPTARG;;
     
  esac
done 
shift $(($OPTIND - 1))

# ########################################
# ########################################
# Sanity check
# ########################################
# ########################################
if [ -z $ABSOLUTE_PATH ]
    then
    echo "$DATE_TIME ERROR: Absolute path not defined" "ERROR:${SERVICE_HOSTNAME} - Absolute path not defined" >> $PG_LOG_PARTITION/$LOG_FILE
    exit $E_OPTERROR   
fi
  
if [ -z $WAL_FILE ]
    then
    echo "$DATE_TIME ERROR: WAL filename not defined" "ERROR:${SERVICE_HOSTNAME} - WAL filename not defined" >> $PG_LOG_PARTITION/$LOG_FILE
    exit $E_OPTERROR   
fi  

if [ -z $SERVICE_HOSTNAME ]
    then
    echo "$DATE_TIME ERROR: Hostname/SG package not defined" "ERROR:${HOSTNAME_LONG} - Hostname/SG package not defined" >> $PG_LOG_PARTITION/$LOG_FILE
    exit $E_OPTERROR   
fi

LOG_FILE="$SCRIPT_ARCHIVE_COMMAND-${PG_NOMBRE_INSTANCIA}.${SERVICE_HOSTNAME}.log"

check_wal_file
check_partitions
archive_wal

exit 0

#
# EOF
