Let's take a look at the `docker-compose.yml`{{open}} file in more detail.

Images used:

- `gohelloworld` build via `Dockerfile`{{open}}
- [golang](https://hub.docker.com/_/golang) official image - also used as base for `gohelloworld` and for other actions
- [amazon/aws-cli](https://hub.docker.com/r/amazon/aws-cli) is used to perform some AWS actions
