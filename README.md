# vsftpd server with virtual FTP user in Docker

This repo build a Docker image of vsftpd server that allows virtual FTP user login.

The repo contains a *vsftpd.conf* that can work with the sample *docker-compose.yml* file below.


```
version: '2'
services:
  vsftpd:
    image: cheewai/docker-vsftpd
    environment:
      - RUNUSER_UID=1000
    volumes:
      - ./passwd:/etc/vsftpd/passwd
      - ./docker-vsftpd/vsftpd.conf:/etc/vsftpd.conf
      - ./data:/srv/ftp/runuser
    ports:
      - "21:21"
      - "21100-21110:21100-21110"
    restart: on-failure:5
```

## Usage

* Customize *vsftpd.conf* and *docker-compose.yml* as per your requirements

* Create *passwd* containing the virtual FTP user(s) login name and encrypted password

* Run the docker image using `docker-compose` or `docker`

