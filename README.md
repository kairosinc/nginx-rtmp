# Docker-nginx-rtmp
Docker image for an RTMP/HLS server running on nginx based on jasonrivers/nginx-rtmp

NGINX Version 1.9.15
nginx-rtmp-module Version 1.1.7

### Running

To run the container and bind the port 1935 to the host machine; run the following:

```
docker run -p 1935:1935 -p 80:80 nginx-rtmp
```

### Git reposiory
The source files for this project can be found here: [https://github.com/kairosinc/nginx-rtmp](https://github.com/nginx-rtmp)

If you have any improvements please submit a pull request.

## Running
To simply run the container:

```
make build && make run && make copy
```

This will place a file called nginx-rtmp.tar.gz in the current directory containing the nginx-rtmp compiled binary and configuration files.

