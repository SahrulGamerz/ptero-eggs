#!/bin/ash
git clone https://github.com/SahrulGamerz/ptero-eggs ./temp
cp -r ./temp/nginx ./
cp -r ./temp/php-fpm ./
cp -r ./temp/webroot ./
cp ./temp/start.sh ./
chmod +x ./start.sh
rm -rf ./temp

echo "Starting PHP-FPM..."
php-fpm8 --fpm-config /home/container/php-fpm/php-fpm.conf --daemonize

echo "Starting Nginx..."
nginx -c /home/container/nginx/nginx.conf
