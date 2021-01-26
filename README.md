# docker-prestashop

Quickly bootstrap a local prestashop env with docker-compose

## Requirements

- [docker](https://docs.docker.com/get-docker/)
- [docker-compose](https://docs.docker.com/compose/install/)
- [ngrok](https://ngrok.com/download)

## Usage

```bash
$ alias dc="docker-compose" # you may store this in ~/.bash_aliases and source ~/.bashrc
$ dc up -d prestashop
$ ngrok http 8000
$ open http://xxxxxx.ngrok.io/admin-test/ # login: demo@prestashop.com / prestashop_demo
```

## Ressources

- https://hub.docker.com/r/prestashop/prestashop
