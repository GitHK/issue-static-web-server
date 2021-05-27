FROM joseluisq/static-web-server:1.15.0-alpine as base

# simcore-user uid=8004(scu) gid=8004(scu) groups=8004(scu)
ENV SC_USER_ID=8004 \
    SC_USER_NAME=scu

RUN adduser -D -u ${SC_USER_ID} -s /bin/sh -h /home/${SC_USER_NAME} ${SC_USER_NAME}

# changing ownership of static-web-server files
RUN chown -R ${SC_USER_NAME}:${SC_USER_NAME} /entrypoint.sh
RUN chown -R ${SC_USER_NAME}:${SC_USER_NAME} /usr/local/bin/static-web-server
RUN chown -R ${SC_USER_NAME}:${SC_USER_NAME} /public
RUN chmod +x /usr/local/bin/static-web-server

USER ${SC_USER_NAME}

