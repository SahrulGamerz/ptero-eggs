#!/bin/bash
sleep 1

cd /home/container

# Replace Startup Variables
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo ":/home/container$ ${MODIFIED_STARTUP}"

# Run the Server
git clone https://github.com/SahrulGamerz/ptero-eggs /home/container/temp
cp -r /home/container/temp/nginx /home/container/
cp -r /home/container/temp/php-fpm /home/container/
cp -r /home/container/temp/webroot /home/container/
cp /home/container/temp/start.sh /home/container/
chmod +x /home/container/start.sh
rm -rf /home/container/temp

${MODIFIED_STARTUP}
