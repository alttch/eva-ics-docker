from alpine:3.14.0
RUN apk add jq
RUN apk add curl
RUN apk add gcc
RUN apk add g++
RUN apk add libjpeg jpeg-dev libjpeg-turbo-dev libpng-dev
RUN apk add python3 python3-dev
RUN apk add bash
RUN apk add libc-dev
RUN apk add libffi-dev
RUN apk add openssl-dev
RUN apk add freetype-dev
RUN apk add make
RUN apk add py3-pandas
#COPY owfs-builder.sh /opt
#RUN /opt/owfs-builder.sh
COPY eva-dist.tgz /opt/
COPY venv-builder.sh /opt
RUN /opt/venv-builder.sh
RUN ln -s /usr/include/locale.h /usr/include/xlocale.h
RUN apk add musl-dev
RUN apk add g++
RUN /opt/eva/install/build-venv /
RUN tar cvf build.tar /venv /usr/lib/libstdc* /usr/lib/libgcc_s*
#/usr/lib/libow* 
