# Pull base image.
FROM ubuntu:14.04

# Install Nginx
RUN \
    apt-get update && \
    apt-get install -y nginx php5-fpm php5-mysql php5-sqlite && \
    rm -rf /var/lib/apt/lists/*

COPY files/nginx.conf /etc/nginx/nginx.conf
COPY files/default /etc/nginx/sites-available/default
COPY files/www.conf /etc/php5/fpm/pool.d/www.conf

RUN cp -R /etc/nginx /etc/nginx.default

# Define mountable directories.
VOLUME ["/etc/nginx/", "/usr/share/nginx", "/var/log/nginx"]

# Define working directory.
WORKDIR /etc/nginx
