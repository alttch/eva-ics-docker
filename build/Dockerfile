from alpine:3.14.0
RUN apk add jq
RUN apk add curl
RUN apk add libjpeg libpng freetype
RUN apk add python3
RUN apk add bash
RUN apk add vim
RUN apk add tar
RUN apk add libffi
# MSAD
RUN apk add libldap libsasl libltdl libuuid
# NET SNMP
RUN apk add net-snmp-libs net-snmp-agent-libs
RUN ln -s /usr/include/locale.h /usr/include/xlocale.h
ADD lib.tar.gz /
ADD libow.tar.gz /
COPY eva-dist.tgz /opt/
COPY ./venv.yml /
ADD ./setup.sh /
RUN sh -x ./setup.sh
COPY ./update-script /opt/eva/update.sh
RUN chmod +x /opt/eva/update.sh
RUN tar cvf eva.tar /opt/eva
