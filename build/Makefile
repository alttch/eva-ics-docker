all:
	make b
	docker build -t altertech/eva-min-builder .
	docker run -v /opt/eva-docker-minimal/build/b:/b -i -t altertech/eva-min-builder cp /build.tar /b/
	mv ./b/build.tar ../run/
