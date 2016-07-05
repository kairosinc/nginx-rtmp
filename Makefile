.PHONY: build copy rm run

build:
	docker build --no-cache -t nginx-rtmp .
copy:
	DID=`docker create nginx-rtmp`
	docker cp ${DID}:/tmp/nginx-rtmp.tar.gz dist/
rm:
	docker rm nginx-rtmp
run:
	docker run -p 1935:1935 -p 80:80 nginx-rtmp
