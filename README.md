# Deno Deploy in Docker

Deno Deploy is currently in public beta. The website states that any service developed will be able to self host [“on your own cloud instance”](https://deno.com/deploy).

Until then, this POC allows you to run your Deno Deploy scripts inside Docker.

## Run locally

First, make sure you have installed [Deno](https://deno.land/#installation) as well as [deployctl](https://deno.com/deploy/docs/deployctl).

> `deployctl` allows you to run your Deno Deploy scripts locally on your machine.

To run the demo script like it would on Deno Deploy, execute:

```shell
deployctl run main.js
```

## Run in Docker

To run in docker, first build the app:

```shell
docker build -t app .
```

All dependencies of your Deno script will be pre-cached into the Docker container.

Then run the container:

```shell
docker run -it --init -p 1993:1993 app
```
