from alpine:3.14.0
RUN apk add jq
RUN apk add curl
RUN apk add libjpeg libpng freetype
RUN apk add python3 py3-pandas
RUN apk add bash
RUN apk add vim
RUN apk add tar
RUN ln -sf /usr/bin/python3 /usr/bin/python
ADD build.tar /
COPY eva-dist.tgz /opt/
COPY yedb.tgz /opt/
RUN ln -sf /opt/eva/bin/eva /usr/local/bin/eva-shell
RUN ln -sf /opt/eva/bin/eva /usr/local/bin/eva
RUN ln -sf /opt/eva/bin/eva-registry /usr/local/bin/eva-registry
# copy scripts and configs
COPY eva-runner /
RUN chmod +x /eva-runner
COPY eva-registry-setup /
RUN chmod +x /eva-registry-setup
COPY eva-dist.tgz /opt/
EXPOSE 162/udp 8881/udp 8812 8813 8817 8818 8828 8829
CMD [ "/bin/sh", "-c", "/eva-runner" ]
