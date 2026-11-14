# Phase 3: Advanced Linux Permissions & ACL

## Project
Kartekeya - Enterprise Linux Server Administration & Hardening

## Environment
- OS: Red Hat Enterprise Linux 9.6
- Hostname: kartekeya-server
- User: kartik
- Group: projectteam

## 1. Linux File Permissions (chmod)
- Practiced numeric permissions: 600 and 755.
- Practiced symbolic permissions using chmod.
- Verified permissions using ls -l.

## 2. Ownership Management
- Changed file ownership using chown.
- Changed group ownership using chgrp.
- Verified ownership using ls -l.

## 3. Group Permissions
- Created group-test.txt.
- Assigned projectteam group ownership.
- Configured permissions as 640.
- Tested group read and write access using kartik.

## 4. SUID (Set User ID)
- Applied SUID using chmod u+s.
- Observed uppercase S and lowercase s.
- Verified SUID using ls -l.

## 5. SGID (Set Group ID)
- Created shared-project directory.
- Applied SGID using chmod 2775.
- Verified group inheritance for newly created files.

## 6. Sticky Bit
- Created public-shared directory.
- Applied sticky bit using chmod +t.
- Tested file deletion restrictions between users.

## 7. Access Control Lists (ACL)
- Used setfacl to assign named-user permissions.
- Used getfacl to inspect ACL entries.
- Granted kartik read and write permissions.
- Verified ACL-based access.

## 8. ACL Mask
- Restricted ACL mask to read-only.
- Verified effective permissions.
- Tested denied write access.
- Restored read-write mask and verified access.

## 9. ACL Removal
- Removed a specific ACL entry using setfacl -x.
- Removed extended ACL entries using setfacl -b.
- Verified final permissions.

## 10. Default ACL Inheritance
- Created default-acl-lab directory.
- Configured default ACL for kartik.
- Created a new file and verified inherited ACL.
- Tested successful write access.

## 11. Subdirectory ACL Inheritance
- Created subdir-test inside default-acl-lab.
- Verified inherited default ACL entries.
- Granted kartik rwx access to the subdirectory.
- Created kartik-subdir-file.txt as kartik.
- Verified inherited ACL on the new file.

## Evidence Files
- 20-chmod-600.txt
- 21-chmod-755.txt
- 22-chown-owner.txt
- 23-chgrp-group.txt
- 24-group-permission-test.txt
- 25-suid-permission.txt
- 26-sgid-group-inheritance.txt
- 27-sticky-bit-test.txt
- 28-acl-user-mask-test.txt
- 29-acl-removal-test.txt
- 30-default-acl-inheritance.txt
- 31-default-acl-subdirectory.txt

## Conclusion
Successfully completed Linux file permissions, ownership management,
special permission bits, ACL management, ACL masks and default ACL inheritance.

Phase 3: Advanced Permissions & ACL - Completed.
