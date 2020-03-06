all:
	mkdir -p b
	docker build -t altertech/eva-ics-builder .
	docker run -v `pwd`/b:/b altertech/eva-ics-builder cp /build.tar /b/
	mv ./b/build.tar ../run/
