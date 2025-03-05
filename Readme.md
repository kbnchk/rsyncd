# RSYNCD Docker image

Docker image for rsync deamon.
Allows to sync folders from host to docker containers.
Designed only for internal use in docker bridge network. My usecase was to sync host ssl certificates with another host via amnezia-wg running in docker containers.

### Usage:

- ajust docker-compose.yml parameters according to your needs and set folder you wish to sync

- deploy service with docker-compose.yml

```
docker compose up -d
```
- get rsync access to your folder remotely

```
rsync rsync://<YOUR IP OR HOST>:873/volume
```

### WARNING: No security implemented yet, designed for use in internal docker network