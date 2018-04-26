FROM node:alpine

LABEL authors="andrescabana86"

RUN apk update \
  && apk add --update alpine-sdk python \
  && yarn global add @angular/cli@latest typescript \
  && ng set --global packageManager=yarn \
  && apk del alpine-sdk python \
  && rm -rf /tmp/* /var/cache/apk/* *.tar.gz ~/.npm \
  && npm cache clean --force \
  && yarn cache clean \
  && sed -i -e "s/bin\/ash/bin\/sh/" /etc/passwd

ENTRYPOINT ["/bin/bash"]