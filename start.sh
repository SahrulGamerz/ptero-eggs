#!/bin/ash
git clone https://github.com/SahrulGamerz/ptero-eggs.git ./temp
if [[ -d "./nginx" ]]
then
    echo "File exists not cloning files"
else
    echo "Cloning nginx folder"
    cp -r ./temp/nginx ./
fi
if [[ -d "./php-fpm" ]]
then
    echo "File exists not cloning files"
else
    echo "Cloning php-fpm folder"
    cp -r ./temp/php-fpm ./
fi
if [[ -d "./webroot" ]]
then
    echo "File exists not cloning files"
else
    echo "Cloning webroot folder"
    cp -r ./temp/webroot ./
fi

cp ./temp/start.sh ./
chmod +x ./start.sh
rm -rf ./temp

echo "Starting PHP-FPM..."
php-fpm8 --fpm-config /home/container/php-fpm/php-fpm.conf --daemonize

echo "Starting Nginx..."
echo "=!=!=!== Please ignore the error about no permissions to the log file. ==!=!=!="
nginx -c /home/container/nginx/nginx.conf
