#!/bin/bash -e

# install signalk-server docker-compose.yml under /opt/containers/signalk-server
mkdir -p "${ROOTFS_DIR}/opt/containers/signalk-server"
install -m 644 files/signalk-server-docker-compose.yml "${ROOTFS_DIR}/opt/containers/signalk-server/docker-compose.yml"

# Create a data directory for signalk-server with FIRST_USER_NAME as owner
on_chroot << EOF
mkdir -p /opt/containers/signalk-server/data/{grafana,influxdb2,signalk}
chown -R $FIRST_USER_NAME:$FIRST_USER_NAME /opt/containers/signalk-server/data/{influxdb2,signalk,grafana}
EOF

# Enable docker-compose@signalk-server service
on_chroot << EOF
systemctl enable docker-compose@signalk-server
EOF
