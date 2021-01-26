# docker-prestashop

Quickly bootstrap a local prestashop env with docker-compose

## Requirements

- [docker](https://docs.docker.com/get-docker/)
- [docker-compose](https://docs.docker.com/compose/install/)
- [ngrok](https://ngrok.com/download)

## Usage

(Optional) if you have an ngrok account, fill your token in `.env`:

```bash
cp .env.dist .env
edit .env
```

> Note: without authentication your ngrok session will last 2h.

Run the server:

```bash
$ alias dc="docker-compose" # you may store this in ~/.bash_aliases and source ~/.bashrc
$ dc up -d
```

Your server is up, and you can reach it directly from http://localhost:8000.
To find out what is your ngrok public IP, connect to your local ngrok instance http://localhost:4040, and find a link to something like http://xxxxxxxxxxxx.ngrok.io.

You will be redirected to your shop's public IP, where you have to add `/admin-test/` to access to your back office with the above credentials:

* login: demo@prestashop.com
* password: prestashop_demo

## Ressources

- https://hub.docker.com/r/prestashop/prestashop
- https://hub.docker.com/r/wernight/ngrok
