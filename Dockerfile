FROM debian:buster

RUN apt-get -y update && apt-get -y upgrade

RUN apt-get -y install vim

RUN apt-get -y install nginx

RUN apt-get -y install default-mysql-server php php-mysql php-json php-fpm

#for wordpress вы€снить что надо дл€ пхпмайјƒћ»Ќ
RUN apt-get -y install php-curl php-mbstring php-xml



RUN apt-get -y install openssl

RUN apt-get -y install wordpress

RUN mv /usr/share/wordpress /var/www/html

ADD https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.tar.gz pma.tar.gz
RUN tar xvzf pma.tar.gz && mv phpMyAdmin-5.0.2-all-languages /var/www/html/phpmyadmin

RUN chown -R www-data:www-data /var/www/html


COPY ./srcs/config.inc.php /var/www/html/phpmyadmin/
RUN chmod 755 /var/www/html/phpmyadmin/config.inc.php

COPY ./srcs/run_server.sh ./srcs/sql_database.sql /

RUN service mysql start && mysql < sql_database.sql


COPY ./srcs/autoindex_off.sh ./srcs/autoindex_on.sh /var/www/

COPY ./srcs/default /etc/nginx/sites-available

COPY ./srcs/localhost.crt ./srcs/device.key /etc/nginx/ssl/

COPY ./srcs/wp-config.php /var/www/html/wordpress

#delit
COPY ./srcs/index.html ./srcs/pic.png ./srcs/phpinfo.php /var/www/html/

COPY ./srcs/404.html /usr/share/nginx/html/
#delit


#ENTRYPOINT bash run_server.sh
CMD bash run_server.sh && sleep infinity 

#CMD ping localhost 




