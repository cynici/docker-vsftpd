FROM debian:jessie
MAINTAINER Cheewai Lai <clai@csir.co.za>

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
 && apt-get -y dist-upgrade \
 && apt-get -y install --no-install-recommends vsftpd libpam-pwdfile less \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
 && mkdir /etc/vsftpd \
 && chown root.root /etc/vsftpd \
 && chmod 750 /etc/vsftpd \
 && echo 'auth	required pam_pwdfile.so pwdfile /etc/vsftpd/passwd' >/etc/pam.d/myvsftpd \
 && echo 'account required pam_permit.so' >>/etc/pam.d/myvsftpd

ADD docker-entrypoint.sh /docker-entrypoint.sh

RUN chown root.root /docker-entrypoint.sh \
 && chmod 755 /docker-entrypoint.sh \
 && mkdir -p /var/run/vsftpd/empty \
 && chmod -R 755 /var/run/vsftpd

ENTRYPOINT /docker-entrypoint.sh
