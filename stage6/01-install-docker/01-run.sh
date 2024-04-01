#!/bin/bash -e

# Add the default user to the docker group

on_chroot << EOF
adduser $FIRST_USER_NAME docker
EOF

# Install docker-compose unit file
install -m 644 files/docker-compose@.service "${ROOTFS_DIR}/etc/systemd/system/docker-compose@.service"
