#!/bin/ash
echo "Starting PHP-FPM..."
php-fpm8 --fpm-config /home/container/php-fpm/php-fpm.conf --daemonize

echo "Starting Nginx..."
nginx -c /home/container/nginx/nginx.conf
