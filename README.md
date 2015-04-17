# phpMyAdmin in Docker

See http://www.phpmyadmin.net - Bringing MySQL to the web

## Usage

### Build the image

You can clone this repository and build your own image:

   $ git clone git@github.com:derick-schoonbee/docker-phpmyadmin.git
   $ cd docker-phpmyadmin
   $ docker build -t phpmyadmin .

## Administer your datbase

   $ docker run -it --rm -p 10085:80 -e PHP_MYADMIN_HOST=192.168.0.31 phpmyadmin
   $ open http://dockerhost:10085
