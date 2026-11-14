# Phase 9 – Backup, Cron & Log Management

## 1. Objective
Implemented automated configuration backups, scheduled backup execution, backup restoration verification, and log rotation on RHEL 9.6.

## 2. Backup Preparation
- Created dedicated backup directory:
  `/opt/kartekeya-linux-server-administration/backups/phase-9`
- Verified `tar` and `gzip` packages.
- Selected configuration directories:
  - `/etc/httpd`
  - `/etc/ssh`
  - `/etc/firewalld`
  - `/etc/selinux`
- Excluded SSH private host keys from backups.

## 3. Automated Backup Script
Script:
`/opt/kartekeya-linux-server-administration/scripts/phase9-config-backup.sh`

Features:
- Timestamp-based backup filenames.
- Compressed TAR.GZ archives.
- Backup success/failure reporting.
- SSH host private key exclusion.

## 4. Scheduled Backup Using Cron
Configured root crontab:

`0 2 * * * /opt/kartekeya-linux-server-administration/scripts/phase9-config-backup.sh >> /var/log/kartekeya-backup.log 2>&1`

- Schedule: Daily at 2:00 AM.
- Output redirected to `/var/log/kartekeya-backup.log`.
- Cron service: `crond` active and enabled.

## 5. Backup Verification & Restoration
- Verified backup archive integrity using `tar -tzf`.
- Extracted backup into `/tmp/phase9-restore-test`.
- Compared restored Apache configuration with original using `diff -qr`.
- No differences found.
- Removed temporary restore-test directory.

## 6. Log Management & Rotation
Log file:
`/var/log/kartekeya-backup.log`

Logrotate configuration:
`/etc/logrotate.d/kartekeya-backup`

Policy:
- Daily rotation.
- Retain 7 rotated logs.
- Compress old logs.
- Ignore missing or empty log files.
- Create new log with permissions `0640` and ownership `root:root`.

Validated configuration using logrotate debug mode.

## 7. Result
Successfully implemented configuration backup automation, daily cron scheduling, backup integrity verification, restoration testing, and log rotation configuration.
