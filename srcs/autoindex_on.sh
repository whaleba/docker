#bin
sed -i 's/autoindex off;/autoindex on;/' /etc/nginx/sites-available/default
service nginx reload

#service nginx restart
echo "autoindex on"