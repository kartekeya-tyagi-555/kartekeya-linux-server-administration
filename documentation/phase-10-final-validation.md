# Phase 10 – Final Server Validation & Health Audit

## 1. Objective
Performed final health, security, storage, network and service validation on the RHEL 9.6 server.

## 2. Service Health Check
Verified the following services:
- SSHD – Active
- Firewalld – Active
- HTTPD – Active
- CROND – Active

Disabled unsupported `mcelog` service due to VMware virtual CPU incompatibility.

Final failed service count: 0.

## 3. Security Validation
- SELinux status: Enforcing
- Firewall status: Running
- SSH root login: Disabled
- SSH password authentication: Disabled
- SSH public key authentication: Enabled
- SSH configuration syntax: Valid
- Recent SELinux AVC denials: None found

## 4. Storage Validation
- Verified filesystem usage using `df -hT`.
- Verified LVM Physical Volumes, Volume Groups and Logical Volumes.
- Confirmed `/data/app` and `/data/backup` mounts.
- Validated `/etc/fstab`.
- Result: No errors or warnings detected.

## 5. Network Validation
- Network interface: ens160
- IPv4 address: 192.168.31.128/24
- Interface status: UP

## 6. Apache Validation
- Apache service: Active
- HTTP response: 200 OK
- Virtual Host: kartekeya.local
- Apache configuration syntax: Syntax OK

## 7. Final Audit Result
All critical server services are active.
Security enforcement is enabled.
Storage and network configurations are operational.
SSH and Apache configurations passed syntax validation.
No failed systemd services or recent SELinux AVC denials were detected.

## 8. Conclusion
Successfully completed final server health and configuration validation for the Linux Server Administration project.
