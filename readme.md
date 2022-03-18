# php81-alpine

## What is this?

This is a custom build based on PHP 8.1's Alpine docker image, with changes to make Laravel back-end testing easily possible.

## Quick start

In order to build and then test the container:

    docker buildx build . --platform linux/amd64 -t diveinteractive/php81-alpine \
    && docker run -it diveinteractive/php81-alpine sh

## Automatic builds

The automatically build the container and have it pushed, you must:

* Tag the commit you wish to build
* Create a new release with said tag

The Docker action will automatically build the release and push it under that tag to Docker Hub.
d
## Where can I find it?

You can find the image on Docker Hub here: https://hub.docker.com/r/diveinteractive/php81-alpine.