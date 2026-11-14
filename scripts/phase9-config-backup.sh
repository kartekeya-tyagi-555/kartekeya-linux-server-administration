#!/bin/bash

# Phase 9 - Automated Configuration Backup

BACKUP_DIR="/opt/kartekeya-linux-server-administration/backups/phase-9"
TIMESTAMP=$(date +%F-%H%M%S)
BACKUP_FILE="$BACKUP_DIR/config-backup-$TIMESTAMP.tar.gz"

echo "Starting configuration backup..."

tar -czf "$BACKUP_FILE" \
    --exclude='etc/ssh/ssh_host_*' \
    -C / etc/httpd etc/ssh etc/firewalld etc/selinux

if [ $? -eq 0 ]; then
    echo "Backup completed successfully!"
    echo "Backup file: $BACKUP_FILE"
else
    echo "Backup failed!"
    exit 1
fi
