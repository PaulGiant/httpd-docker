# httpd-docker
Apache http server container

### Build the container

docker build -t my-httpd .

Place your content in www directory

### Run the container

docker run -ti -d -p 8443:443 -v /www:/usr/local/apache2/htdocs/ my-httpd
