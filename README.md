# phpMyAdmin in Docker

See http://www.phpmyadmin.net - Bringing MySQL to the web


### Build

You can clone this repository and build your own image:

    $ git clone git@github.com:derick-schoonbee/docker-phpmyadmin.git
    $ cd docker-phpmyadmin
    $ docker build -t phpmyadmin .

## Using (Example)

Let's imagine your mySQL sever is listening host 192.168.0.31 and you want to connect to phpMyAdmin
on your docker host with port 10085 :

    $ docker run -it --rm -p 10085:80 -e PHP_MYADMIN_HOST=192.168.0.31 phpmyadmin
    $ open http://dockerhost:10085
