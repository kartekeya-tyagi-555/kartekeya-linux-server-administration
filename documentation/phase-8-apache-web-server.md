# Phase 8 – Apache HTTP Server Administration

## 1. Objective
Configure and manage the Apache HTTP Server on RHEL 9.6, deploy a custom website, configure a name-based Virtual Host, and verify service operation, logs, firewall access, and SELinux permissions.

## 2. Apache Installation and Service Management

- Web Server: Apache HTTP Server
- Package: httpd
- Version: 2.4.62
- Operating System: RHEL 9.6

The Apache package was already installed on the system.

Service configuration:
- Started Apache using `systemctl start httpd`.
- Enabled automatic startup using `systemctl enable httpd`.
- Verified service status as active (running).

## 3. Apache Configuration

Main configuration directory:

`/etc/httpd/`

Website document root:

`/var/www/html/`

A custom `index.html` page was created containing:
- Project name
- Server hostname
- Operating system information
- Apache web server information

Apache configuration syntax was verified using:

`apachectl configtest`

Result: `Syntax OK`

A separate ServerName configuration was created:

`/etc/httpd/conf.d/servername.conf`

Configuration:

`ServerName kartekeya-server`

Apache was restarted successfully after configuration changes.

## 4. Website Access Verification

The custom webpage was tested using:

`curl http://localhost`

The server returned the custom HTML page successfully.

HTTP response was also verified through the server IP:

`curl -I http://192.168.31.128`

Result: `HTTP/1.1 200 OK`

## 5. Apache Virtual Host Configuration

A separate website directory was created:

`/var/www/kartekeya`

A custom webpage was created inside this directory.

Virtual Host configuration file:

`/etc/httpd/conf.d/kartekeya.conf`

Configuration details:
- Virtual Host: `*:80`
- ServerName: `kartekeya.local`
- DocumentRoot: `/var/www/kartekeya`
- Directory access: `Require all granted`
- Custom access and error logs configured.

Dedicated log files:

- `/var/log/httpd/kartekeya-access.log`
- `/var/log/httpd/kartekeya-error.log`

The Virtual Host was tested using:

`curl -H "Host: kartekeya.local" http://localhost`

Domain-based access was also verified using:

`curl --resolve kartekeya.local:80:127.0.0.1 http://kartekeya.local`

Both tests returned the custom Virtual Host webpage successfully.

## 6. Apache Log Management

Default Apache logs:

- `/var/log/httpd/access_log`
- `/var/log/httpd/error_log`

Virtual Host logs:

- `/var/log/httpd/kartekeya-access.log`
- `/var/log/httpd/kartekeya-error.log`

Access logs confirmed successful HTTP requests with status code 200.

The Virtual Host error log contained no recorded errors during the final check.

## 7. Firewall and SELinux Verification

Firewall services were checked using:

`firewall-cmd --list-services`

The HTTP service was already allowed.

SELinux contexts were verified for website content:

`ls -Z /var/www/html/index.html`

`ls -Zd /var/www/kartekeya`

Both locations had the expected `httpd_sys_content_t` SELinux context.

Website file permissions were verified as `644`.

## 8. Virtual Host Mapping Verification

Apache Virtual Host configuration was inspected using:

`httpd -S`

Verified mapping:

- Virtual Host: `*:80`
- ServerName: `kartekeya.local`
- Configuration: `/etc/httpd/conf.d/kartekeya.conf`

## 9. Final Service Audit

Final service verification confirmed:

- Apache service status: `active`
- Automatic startup: `enabled`
- Listening port: `80`
- Apache processes: running and listening.

Final audit evidence:

`evidence/command-outputs/79-apache-final-audit.txt`

## 10. Conclusion

Apache HTTP Server was successfully configured and verified on the RHEL 9.6 server.

The project now includes a working custom webpage, a name-based Virtual Host, dedicated logging, verified firewall access, and correct SELinux content contexts.

**Phase 8 – Apache HTTP Server Administration: COMPLETED**
