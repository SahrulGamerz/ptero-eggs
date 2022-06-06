#!/bin/ash
git clone https://github.com/SahrulGamerz/ptero-eggs.git ./temp
if [[ -f "./nginx" ]]
    echo "Cloning nginx folder"
    cp -r ./temp/nginx ./
else if [[ -f "./php-fpm" ]]
    echo "Cloning php-fpm folder"
    cp -r ./temp/php-fpm ./
else if [[ -f "./webroot" ]]
    echo "Cloning webroot folder"
    cp -r ./temp/webroot ./
then
    echo "File exists not cloning files"
fi

cp ./temp/start.sh ./
chmod +x ./start.sh
rm -rf ./temp

echo "Starting PHP-FPM..."
php-fpm8 --fpm-config /home/container/php-fpm/php-fpm.conf --daemonize

echo "Starting Nginx..."
echo "=!=!=!== Please ignore the error about no permissions to the log file. ==!=!=!="
nginx -c /home/container/nginx/nginx.conf
