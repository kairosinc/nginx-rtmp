## Introduction
This is a Dockerfile to build a container image for nginx-rtmp using Phusion as the base. 

### Git reposiory
The source files for this project can be found here: [https://github.com/kairosinc/nginx-rtmp](https://github.com/nginx-rtmp)

If you have any improvements please submit a pull request.

## Running
To simply run the container:

```
make run && make copy
```
This will place a file called nginx-rtmp.tgz in the current directory containing the nginx-rtmp compiled binary and configuration files.
