.PHONY: build copy rm run exec

build:
	docker build --no-cache -t quay.io/kairosinc/nginx-rtmp .
copy:
	DID=`docker create quay.io/kairosinc/nginx-rtmp`
	docker cp ${DID}:/tmp/nginx-rtmp.tar.gz dist/
exec:
	docker exec -it quay.io/kairosinc/nginx-rtmp sh
rm:
	docker rm regsitry.prod.kairos.com/nginx-rtmp
run:
	docker run -d -p 1935:1935 -p 80:80 quay.io/kairosinc/nginx-rtmp
