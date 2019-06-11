from alpine:3.9.3
RUN apk add jq
RUN apk add curl
RUN apk add gcc
RUN apk add libjpeg jpeg-dev libjpeg-turbo-dev libpng-dev
RUN apk add python3 python3-dev
RUN apk add bash
RUN apk add libc-dev
RUN apk add libffi-dev
RUN apk add openssl-dev
RUN apk add freetype-dev
RUN apk add make
COPY owfs-builder.sh /opt
RUN /opt/owfs-builder.sh
COPY eva-dist.tgz /opt/
COPY venv-builder.sh /opt
RUN /opt/venv-builder.sh
RUN rm -f /etc/venv
RUN ln -s /usr/include/locale.h /usr/include/xlocale.h
RUN apk add musl-dev
RUN apk add g++
RUN /opt/eva/install/build-venv /
RUN tar cvf build.tar /python3 /usr/lib/libow*
