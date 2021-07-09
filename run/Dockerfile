from alpine:3.14.0
RUN apk add jq
RUN apk add curl
RUN apk add libjpeg libpng freetype
RUN apk add python3
RUN apk add bash
RUN apk add vim
RUN apk add tar
RUN apk add libffi
RUN ln -sf /usr/bin/python3 /usr/bin/python
# MSAD
RUN apk add libldap libsasl libltdl libuuid
# NET SNMP
RUN apk add net-snmp-libs net-snmp-agent-libs
ADD lib.tar.gz /
ADD libow.tar.gz /
ADD eva.tar /
RUN ln -sf /opt/eva/bin/eva /usr/local/bin/eva-shell
RUN ln -sf /opt/eva/bin/eva /usr/local/bin/eva
RUN ln -sf /opt/eva/bin/eva-registry /usr/local/bin/eva-registry
# copy scripts and configs
COPY .eva_container /
COPY eva-launcher /
CMD echo "" > /.eva_container
CMD [ "/bin/bash", "-c", "/eva-launcher" ]
