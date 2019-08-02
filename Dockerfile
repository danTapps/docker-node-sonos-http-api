FROM node:11

WORKDIR /app

RUN apt-get install tar curl && \
  curl -L https://github.com/jishi/node-sonos-http-api/archive/master.tar.gz | tar xz --strip-components=1 -C /app && \
  mkdir cache && \
  ln -s settings/settings.json && \
  chown -R node:node static cache && \
  npm install --production && \
  rm -rf /tmp/* /root/.npm

EXPOSE 5005

USER node

CMD ["npm", "start"]
ENTRYPOINT ["npm", "start"]

