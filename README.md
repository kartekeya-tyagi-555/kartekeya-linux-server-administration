# Kartekeya – Linux Server Administration & Hardening

A hands-on Linux Server Administration project built on **Red Hat Enterprise Linux (RHEL) 9.6** using VMware Workstation Pro.

The project covers server configuration, user management, security hardening, storage administration, Apache web hosting, automated backups, cron scheduling, log management and final system validation.

## Environment

| Component | Details |
|---|---|
| Operating System | Red Hat Enterprise Linux 9.6 |
| Virtualization | VMware Workstation Pro |
| Shell | Bash |
| Web Server | Apache HTTP Server 2.4 |
| Firewall | firewalld |
| Security | SELinux |
| Storage | LVM, XFS |
| Automation | Cron, Bash Scripts |
| Backup | tar, gzip |
| Log Management | logrotate |

## Project Phases

### Phase 1 – Server Preparation & Baseline Audit
- Initial server configuration
- System information and baseline checks

### Phase 2 – User & Group Management
- Linux users and groups
- Account and access management

### Phase 3 – Advanced Permissions & ACL
- File and directory permissions
- ACL, SUID and SGID

### Phase 4 – SSH Configuration & Hardening
- SSH server configuration
- Root login restrictions
- Password and public key authentication settings

### Phase 5 – Firewalld Configuration & Hardening
- Firewall zone management
- Service access control
- Network security rules

### Phase 6 – SELinux Security Management
- SELinux modes and contexts
- Security policy troubleshooting
- AVC denial analysis

### Phase 7 – LVM Storage Management
- Physical Volumes and Volume Groups
- Logical Volume creation
- XFS filesystems and persistent mounts

### Phase 8 – Apache Web Server Administration
- Apache installation and configuration
- Custom web page hosting
- Name-based Virtual Hosting
- Access and error logs

### Phase 9 – Backup, Cron & Log Management
- Automated configuration backup script
- Scheduled backups using Cron
- Backup archive integrity verification
- Restoration testing
- Log rotation using logrotate

### Phase 10 – Final Server Validation & Health Audit
- Service health verification
- SSH and Apache syntax validation
- Firewall and SELinux checks
- Storage and network verification
- Final system audit

## Project Directory Structure

```text
kartekeya-linux-server-administration/
├── backups/
├── configs/
├── documentation/
├── evidence/
│   ├── command-outputs/
│   ├── screenshots/
│   └── test-results/
├── logs/
├── permissions-lab/
├── scripts/
└── README.md
```

## Key Validation Results

- Critical services running successfully.
- SELinux operating in Enforcing mode.
- Firewall running with configured access rules.
- SSH hardening configuration validated.
- Apache HTTP response verified successfully.
- LVM storage and persistent mounts verified.
- Backup archive integrity and restoration tested.
- Cron backup scheduling configured.
- Log rotation configuration validated.
- Final audit completed with zero failed systemd services.

## Learning Outcomes

Through this project, I gained practical experience in:

- Linux system administration
- Server security and hardening
- User and permission management
- Storage administration using LVM
- Web server configuration
- Bash scripting and task automation
- Backup and recovery procedures
- Troubleshooting and system validation

## Author

**Kartekeya Tyagi**

Linux Server Administration Project  
Platform: RHEL 9.6
