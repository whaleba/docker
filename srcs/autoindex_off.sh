#bin
sed -i 's/autoindex on;/autoindex off;/' /etc/nginx/sites-available/default
service nginx reload

#service nginx restart
echo "autoindex off"