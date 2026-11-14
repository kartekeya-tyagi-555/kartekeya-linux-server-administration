# Phase 5 – Firewalld Configuration & Hardening

## 1. Objective
Configure and secure the RHEL 9.6 server using Firewalld.

## 2. Environment
- Operating System: Red Hat Enterprise Linux 9.6
- Hostname: kartekeya-server
- Server IP: 192.168.31.128
- Network Interface: ens160
- Firewall: Firewalld
- Active Zone: public

## 3. Initial Firewall Audit
- Verified Firewalld service status.
- Checked active and default zones.
- Inspected runtime and permanent configurations.
- Identified available firewall services.
- Verified SSH service and port configuration.

## 4. Firewall Services Management

Configured the following services:

| Service | Port | Protocol |
|---|---|---|
| SSH | 22 | TCP |
| HTTP | 80 | TCP |
| Cockpit | 9090 | TCP |

Added HTTP service to runtime and permanent configurations.

## 5. Custom Port Management

Configured custom TCP port 8080.

- Added port 8080/tcp permanently.
- Added port 8080/tcp at runtime.
- Verified runtime and permanent configurations.
- Tested external connectivity using a temporary Python HTTP server.

## 6. Network Interface Configuration

Configured NetworkManager connection:

- Interface: ens160
- Firewall Zone: public

Verified interface-zone assignment and reloaded Firewalld.

## 7. Rich Rules Configuration

Created a rich rule for TCP port 8080.

Security features:
- Traffic logging enabled.
- Log prefix: FW-8080
- Log level: info
- Rate limit: 5 per minute.
- Action: accept.

Verified incoming traffic from Windows host using journalctl.

## 8. Source IP-Based Access Control

Created a source-based rich rule:

- Source IP: 192.168.31.1
- Destination Port: 9090
- Protocol: TCP
- Action: accept

Tested connectivity from Windows host using a temporary Python HTTP server.

Result: PASS

Removed the temporary source-based rule after testing.

## 9. Firewall Configuration Validation

Executed:

firewall-cmd --check-config

Result: success

Verified runtime and permanent rich rules.

## 10. SSH Connectivity Verification

Tested SSH after firewall configuration.

- SSH key authentication: PASS
- User: kartik
- Server: 192.168.31.128
- SSH service remained accessible.
- Password authentication remained disabled.
- Root SSH login remained disabled.

## 11. Security Cleanup

Removed temporary testing configurations:

- Port 8080/tcp
- Port 9090 source-based rich rule
- FW-8080 logging rich rule

Stopped temporary Python HTTP servers.

Retained required firewall services:

- cockpit
- dhcpv6-client
- http
- ssh

## 12. Final Firewall Configuration

Active Zone: public

Interface: ens160

Allowed Services:
- cockpit
- dhcpv6-client
- http
- ssh

Custom Ports: None

Rich Rules: None

## 13. Evidence Files

37-firewalld-baseline-rules.txt
38-firewalld-available-services.txt
39-ssh-firewall-service.txt
40-firewalld-permanent-services.txt
41-firewalld-runtime-services.txt
42-http-firewall-service.txt
43-firewalld-runtime-ports.txt
44-firewalld-permanent-ports.txt
45-firewalld-complete-runtime-config.txt
46-firewalld-complete-permanent-config.txt
47-firewalld-interface-zone.txt
48-firewalld-reload-verification.txt
49-firewalld-rich-rules.txt
50-firewalld-runtime-rich-rules.txt
51-firewalld-rich-rule-logging.txt
52-firewalld-source-ip-rules.txt
53-source-ip-access-test.txt
54-firewalld-final-rich-rules.txt
55-firewalld-final-audit.txt
56-firewalld-clean-final-config.txt

Screenshots are stored in evidence/screenshots/.

## 14. Conclusion

Successfully configured, tested and hardened Firewalld on RHEL 9.6.

Implemented service management, custom port configuration, rich rules, traffic logging and source IP-based access control.

Verified external connectivity and SSH availability.

Removed temporary testing rules and restored a clean final firewall configuration.
