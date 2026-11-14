# Phase 4 – SSH Configuration & Hardening

## 1. Objective
Secure the RHEL 9.6 server by configuring SSH authentication and restricting unauthorized remote access.

## 2. Environment
- Operating System: Red Hat Enterprise Linux 9.6
- SSH Server: OpenSSH 8.7p1
- Hostname: kartekeya-server
- Server IP: 192.168.31.128
- SSH Port: 22

## 3. Initial SSH Audit
- Verified SSH service status.
- Checked OpenSSH version and installed packages.
- Inspected SSH server configuration.
- Verified effective SSH settings.
- Checked SSH listening port and firewall configuration.
- Tested initial password-based SSH login.

## 4. SSH Key-Based Authentication
Generated an ED25519 SSH key pair for user kartik.

Private Key:
~/.ssh/id_ed25519

Public Key:
~/.ssh/id_ed25519.pub

Installed the public key using ssh-copy-id.

Verified successful SSH login using public key authentication.

## 5. SSH Security Hardening

Modified configuration file:

/etc/ssh/sshd_config.d/01-permitrootlogin.conf

Applied settings:

PermitRootLogin no
PasswordAuthentication no
PubkeyAuthentication yes

### Security Impact
- Disabled direct root SSH login.
- Disabled password-based SSH authentication.
- Enabled public key authentication.

## 6. Configuration Validation

Executed:

sshd -t

Result: No syntax errors.

Verified effective configuration using:

sshd -T

Results:

port 22
permitrootlogin no
pubkeyauthentication yes
passwordauthentication no

## 7. SSH Service Reload

Executed:

systemctl reload sshd

Verified SSH service remained active and running.

## 8. Security Testing

| Test | Result |
|---|---|
| SSH key login for kartik | PASS |
| Root SSH login | BLOCKED |
| Password authentication | BLOCKED |
| SSH configuration syntax | PASS |
| SSH service status | ACTIVE |
| SSH key permissions | PASS |

## 9. SSH Key Permissions

SSH directory: 700
Private key: 600
Public key: 644
authorized_keys: 600

## 10. Backup

Original configuration files backed up under /root/:

- sshd_config
- 01-permitrootlogin.conf

## 11. Evidence Files

- 32-ssh-hardening-effective-config.txt
- 33-ssh-service-final-status.txt
- 34-ssh-hardening-config-file.txt
- 35-ssh-key-permissions.txt
- 36-ssh-authentication-logs.txt

Screenshots are stored in evidence/screenshots/.

## 12. Conclusion

Successfully configured and hardened OpenSSH on RHEL 9.6.

The server now uses public key authentication, rejects password-based SSH login, and prevents direct root SSH access.
