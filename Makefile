.PHONY: build copy rm run

build:
	docker build --no-cache -t kairos/nginx-rtmp .
copy:
	docker cp nginx-rtmp:/compiled/nginx-rtmp.tgz .
rm:
	docker rm nginx-rtmp
run:
	docker rm nginx-rtmp 2>/dev/null; docker run --name nginx-rtmp kairos/nginx-rtmp /sbin/my_init -- find /compiled
