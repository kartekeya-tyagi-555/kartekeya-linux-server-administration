# Phase 6 – SELinux Security Management

## Objective
Configure, inspect, and manage SELinux security controls on RHEL 9.6 while maintaining enforcing mode and least-privilege security.

## 1. SELinux Status
- Verified SELinux using `getenforce` and `sestatus`.
- SELinux is enabled.
- Current mode: Enforcing.
- Policy: targeted.
- Configuration mode: Enforcing.

## 2. SELinux File Contexts
Inspected default SELinux contexts using:
- `ls -Z`
- `ls -Zd`

Reviewed security contexts of `/etc`, `/var`, `/home`, and `/root`.

## 3. Temporary Context Modification
- Created `/opt/selinux-lab`.
- Inspected its original SELinux context.
- Changed its type temporarily using `chcon -t var_t`.
- Restored the default context using `restorecon`.

## 4. Permanent File Context Management
- Added a custom file-context rule using `semanage fcontext`.
- Applied the rule using `restorecon -Rv`.
- Created a child file and verified context inheritance.
- Removed the custom rule after testing.
- Restored original contexts and removed the temporary lab directory.

## 5. SELinux Boolean Management
- Inspected Boolean settings using `getsebool`.
- Tested `httpd_can_network_connect`.
- Enabled it temporarily and permanently for demonstration.
- Reverted it permanently to OFF after testing to maintain least privilege.

Final state:
`httpd_can_network_connect --> off`

## 6. SELinux Audit and Troubleshooting
Used:
- `ausearch -m AVC -ts recent`
- `ausearch -m AVC -ts boot`
- `sealert -l '*'`

Reviewed SELinux AVC denial alerts involving the system service `lsmd` and `/usr/bin/passt-repair`.

No custom allow policy was generated because the denial did not require a project-specific exception.

## 7. Final Verification
- SELinux remains enabled.
- SELinux remains in Enforcing mode.
- Targeted policy is loaded.
- Custom file-context rules were removed.
- Temporary lab files were cleaned up.
- HTTPD network-connect Boolean is OFF.

## Evidence
Command outputs are stored in:
`evidence/command-outputs/`

Key evidence:
- 57-selinux-baseline-status.txt
- 58-project-selinux-context.txt
- 59-selinux-context-restore.txt
- 60-selinux-permanent-context-rule.txt
- 61-selinux-child-file-context.txt
- 62-selinux-httpd-boolean.txt
- 63-selinux-final-boolean.txt
- 64-selinux-final-status.txt
- 65-selinux-final-custom-rules.txt

## Conclusion
Successfully inspected and managed SELinux contexts, file-context rules, Booleans, and audit alerts on RHEL 9.6. The system was returned to a clean state with SELinux enforcing and unnecessary custom permissions removed.
