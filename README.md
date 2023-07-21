# SimpleSAMLphp using Docker Compose

[![CI](https://github.com/mschwager/docker-simplesamlphp/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/mschwager/docker-simplesamlphp/actions/workflows/ci.yml)

Run SimpleSAMLphp using `nginx`, `php-fpm`, and Docker Compose.

# Installing

```
$ git clone https://github.com/mschwager/docker-simplesamlphp.git
$ cd docker-simplesamlphp
$ docker-compose build
$ ./bootstrap.sh
```

# Running

```
$ docker-compose up
```

Then you should be able to visit [http://localhost/simplesaml/index.php](http://localhost/simplesaml/index.php).

# Configuration

Configuration files are persistently stored and made available for editing in the `.storage` directory.

To enable the admin interface you must make the following changes in `config.php`:

- Change `auth.adminpassword` from its default value of `123`
- Change `secretsalt` from its default value of `secretsalt123`
- Set `'admin' => TRUE` in `module.enable`

You can then visit [http://localhost/simplesaml/module.php/admin/](http://localhost/simplesaml/module.php/admin/).

From here, you can follow the [next steps](https://simplesamlphp.org/docs/stable/simplesamlphp-install.html#next-steps) for configuring SP and/or IdP functionality.
