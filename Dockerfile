FROM httpd:2.4

RUN sed -i 's/\#Include conf\/extra\/httpd-ssl.conf/Include conf\/extra\/httpd-ssl.conf/g' /usr/local/apache2/conf/httpd.conf
RUN sed -i 's/\#LoadModule ssl_module modules\/mod_ssl.so/LoadModule ssl_module modules\/mod_ssl.so/g' /usr/local/apache2/conf/httpd.conf
RUN sed -i 's/\#LoadModule socache_shmcb_module modules\/mod_socache_shmcb.so/LoadModule socache_shmcb_module modules\/mod_socache_shmcb.so/g' /usr/local/apache2/conf/httpd.conf
COPY ./www /usr/local/apache2/htdocs/
COPY ./servernp.key /usr/local/apache2/conf/server.key
COPY ./server.crt /usr/local/apache2/conf/server.crt

EXPOSE 443
CMD /usr/local/apache2/bin/apachectl -D FOREGROUND
