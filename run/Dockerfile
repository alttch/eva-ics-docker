from alpine:3.13.0
RUN apk add jq
RUN apk add curl
RUN apk add libjpeg libpng freetype
RUN apk add python3 py3-pandas
RUN apk add bash
RUN apk add supervisor
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
COPY eva-supervisor-install /
COPY eva-supervisor-install.conf /etc/supervisor/conf.d/eva-install.conf
COPY eva-dist.tgz /opt/
COPY supervisord.conf /etc/supervisor/
RUN chmod +x /eva-supervisor-install
RUN mkdir -p /var/log/supervisor
EXPOSE 162/udp 8881/udp 8812 8813 8817 8818 8828 8829
CMD [ "/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf" ]
