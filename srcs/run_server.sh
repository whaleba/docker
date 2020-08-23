#!/bin/bash

service mysql restart
service php7.3-fpm start
service nginx restart
#sleep infinity 
#while true
#do
#    echo "Press [CTRL+C] to stop.."
#    sleep 1
#done
#nginx -g 'daemon off;'
bash