all:
	cp ../eva-dist.tgz .
	cp ../update-script .
	mkdir -p b
	docker build -t altertech/eva-ics-builder .
	docker run -v `pwd`/b:/b altertech/eva-ics-builder cp /eva.tar /b/
	mv -f ./b/eva.tar ../run/
	cp -f lib.tar.gz libow.tar.gz ../run/
