#!/bin/ash
echo Please start comment this section to prevent settings overwrite
echo and change file permissions to 555

git clone https://github.com/SahrulGamerz/ptero-eggs.git ./temp
cp -r ./temp/nginx ./
cp -r ./temp/php-fpm ./
cp -r ./temp/webroot ./
cp ./temp/start.sh ./
chmod +x ./start.sh
rm -rf ./temp

echo End of comment

echo "Starting PHP-FPM..."
php-fpm8 --fpm-config /home/container/php-fpm/php-fpm.conf --daemonize

echo "Starting Nginx..."
echo "=!=!=!== Please ignore the error about no permissions to the log file. ==!=!=!="
nginx -c /home/container/nginx/nginx.conf
