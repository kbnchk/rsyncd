#!/bin/sh
VOLUME=${VOLUME:-/volume}
ALLOW=${ALLOW:-172.25.0.0/16}
USER=${USER:-nobody}
GROUP=${GROUP:-nogroup}

mkdir -p ${VOLUME}

cat <<EOF > /etc/rsyncd.conf
uid = ${USER}
gid = ${GROUP}
use chroot = yes
log file = /dev/stdout
reverse lookup = no
[volume]
    hosts deny = *
    hosts allow = ${ALLOW}
    read only = ${READ_ONLY:-true}
    path = ${VOLUME}
    comment = docker volume
EOF

exec /usr/bin/rsync --no-detach --daemon --config /etc/rsyncd.conf