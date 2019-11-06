# docker-ionic

A generic solution to dockerizing Ionic development.

# Specs

Installs 8.3.6 version of Angular, and the latest version of Ionic, on the base image of node:12.2.0.

Any version can be updated, as long as they match.

# Usage
`docker-compose up -d --build`

After it completes, open a local browser: `localhost:8102`

To bring it down, use `docker-compose down`