#! /bin/sh

RUNUSER_UID="${RUNUSER_UID:-1000}"
RUNUSER_HOME="${RUNUSER_HOME:-/srv/ftp/runuser}"

set -ux
useradd -s /bin/false --no-create-home --home-dir $RUNUSER_HOME --uid $RUNUSER_UID runuser

chown root.root /etc/vsftpd/passwd /etc/vsftpd.conf /etc/pam.d/myvsftpd
chmod -R o-rwx /etc/vsftpd
exec vsftpd /etc/vsftpd.conf
