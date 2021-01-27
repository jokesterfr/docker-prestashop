# docker-prestashop

Quickly bootstrap a local and broadly shareable prestashop instance with docker-compose.

## Requirements

- [docker](https://docs.docker.com/get-docker/)
- [docker-compose](https://docs.docker.com/compose/install/)
- (optional) an [ngrok](https://ngrok.com/) account

## Usage

(Optional) if you have an ngrok account, fill your token in `.env`:

```bash
cp .env.dist .env
edit .env
```

> Note: without authentication your ngrok session will last only 2h.

Run the server:

```bash
alias dc="docker-compose" # you may store this in ~/.bash_aliases and source ~/.bashrc
dc down && dc up -d
```

Wait a few minutes and your server will be up, ready to be used from http://localhost:8000/ (will redirect you to a public url like `http://xxxxxxxxxxxx.ngrok.io`).

> Pro tip: to get more information on your ngrok instance go to http://localhost:4040.

Go to http://localhost:8000/admin-test/ to access to your back office, and login with the above credentials:

* login: demo@prestashop.com
* password: prestashop_demo

## Ressources

- https://hub.docker.com/r/prestashop/prestashop
- https://hub.docker.com/r/wernight/ngrok

## What's next

Some ideas for the future:

- enhance performances: https://github.com/PrestaShop/performance-project
- propose a custom Docker image based on:
  * php-fpm / apache or nginx
  * SQLite
- get cleaner docker logs, and add an output for ngrok client info
- add mailHog support https://github.com/mailhog/MailHog
