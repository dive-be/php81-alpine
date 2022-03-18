FROM php:8.1-alpine

# Install PHP modules and clean up
RUN apk add --no-cache $PHPIZE_DEPS \
    imagemagick-dev icu-dev zlib-dev jpeg-dev libpng-dev libzip-dev libgomp; \
    docker-php-ext-configure gd --with-jpeg; \
    docker-php-ext-install intl pcntl gd exif zip mysqli pdo pdo_mysql bcmath; \
    pecl install xdebug; \
    docker-php-ext-enable xdebug; \
    echo "xdebug.mode=coverage" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini; \
    pecl install imagick; \
    docker-php-ext-enable imagick; \
    pecl install redis; \
    docker-php-ext-enable 'redis.so'; \
    apk del $PHPIZE_DEPS; \
    rm -rf /tmp/pear;

# Install other dependencies
RUN apk add --no-cache git curl sqlite \
nodejs npm mariadb-client ncdu openssh-client; \
npm install --global yarn;