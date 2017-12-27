# SimpleSAMLphp using Docker Compose

Run SimpleSAMLphp in Docker containers! This project runs `nginx` and `php-fpm`
via [Docker Compose](https://docs.docker.com/compose/) to host SimpleSAMLphp.

# Installing

```
$ git clone https://github.com/mschwager/docker-simplesamlphp.git
$ cd docker-simplesamlphp
$ docker-compose build
```

# Running

```
$ docker-compose up
```

Then you should be able to visit [http://localhost/simplesaml/index.php](http://localhost/simplesaml/index.php).
