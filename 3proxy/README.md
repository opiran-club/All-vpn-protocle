## 3proxy :

3proxy is awesome and lightweight proxy-server. This image contains stable version with it and can be configured using environment variables. By default, it uses anonymous (information about client hiding) proxy settings. Logging in JSON format.

> Page on `hub.docker.com` can be [found here][link_docker_hub].

TCP ports:

| Port number | Description                                             |
|-------------|---------------------------------------------------------|
| `3128`      | [HTTP proxy](https://3proxy.org/doc/man8/proxy.8.html)  |
| `1080`      | [SOCKS proxy](https://3proxy.org/doc/man8/socks.8.html) |

## Supported tags

| Registry                               | Image                        |
|----------------------------------------|------------------------------|
| [GitHub Container Registry][link_ghcr] | `ghcr.io/tarampampam/3proxy` |
| [Docker Hub][link_docker_hub]          | `tarampampam/3proxy`         |

All supported image tags [can be found here][link_docker_tags].

## Supported environment variables

| Variable name        | Description                                               | Example                |
|----------------------|-----------------------------------------------------------|------------------------|
| `PROXY_LOGIN`        | Authorization login (empty by default)                    | `username`             |
| `PROXY_PASSWORD`     | Authorization password (empty by default)                 | `password`             |
| `PRIMARY_RESOLVER`   | Primary nameserver (dns resolver; `1.0.0.1` by default)   | `8.8.8.8:5353/tcp`     |
| `SECONDARY_RESOLVER` | Secondary nameserver (dns resolver; `8.8.4.4` by default) | `2001:4860:4860::8844` |
| `MAX_CONNECTIONS`    | Maximal connections count (`1024` by default)             | `2056`                 |
| `PROXY_PORT`         | HTTP proxy port number (`3128` by default)                | `8080`                 |
| `SOCKS_PORT`         | SOCKS proxy port number (`1080` by default)               | `8888`                 |

## How can I use this?

For example:

```bash
$ docker run --rm -d \
    -p "3128:3128/tcp" \
    -p "1080:1080/tcp" \
    tarampampam/3proxy:latest
```

Or with auth & resolver settings:

```bash
$ docker run --rm -d \
    -p "3128:3128/tcp" \
    -p "1080:1080/tcp" \
    -e "PROXY_LOGIN=evil" \
    -e "PROXY_PASSWORD=live" \
    -e "PRIMARY_RESOLVER=2001:4860:4860::8888" \
    tarampampam/3proxy:latest
```
