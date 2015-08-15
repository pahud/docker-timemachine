#!/bin/bash

AFP_NAME=${AFP_NAME-'TimeMachine'}
AFP_LOGIN=${AFP_LOGIN-'tm'}
AFP_PASSWORD=${AFP_PASSWORD-'tm'}
AFP_SHARE_DIR=${AFP_SHARE_DIR='/share'}

# Add the user
useradd $AFP_LOGIN -M
echo $AFP_LOGIN:$AFP_PASSWORD | chpasswd


sed -i -e "s#\${AFP_NAME}#${AFP_NAME}#g" /etc/netatalk/afp.conf
sed -i -e "s#\${AFP_SHARE_DIR}#${AFP_SHARE_DIR}#g" /etc/netatalk/afp.conf
sed -i -e "s#\${AFP_LOGIN}#${AFP_LOGIN}#g" /etc/netatalk/afp.conf
sed -i -e "s#\${AFP_NAME}#${AFP_NAME}#g" /etc/netatalk/AppleVolumes.default
sed -i -e "s#\${AFP_SHARE_DIR}#${AFP_SHARE_DIR}#g" /etc/netatalk/AppleVolumes.default

/usr/bin/supervisord --nodaemon
