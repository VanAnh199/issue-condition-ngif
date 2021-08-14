# FROM keymetrics/pm2:8-alpine
FROM quay.io/vmoteam/pm2:14.14.0-alpine
LABEL author="manh.nguyen@vmodev.com"

# Make User
RUN useradd -ms /bin/bash alpine

RUN mkdir -p /home/alpine/gso-webapp
WORKDIR /home/alpine/gso-webapp

COPY server ./server
COPY ecosystem-dev.config.js ./
RUN cd server && yarn install
COPY build ./build
RUN chown -R alpine:alpine /home/alpine

EXPOSE 3001
USER alpine

ENTRYPOINT [ "pm2-runtime","start","ecosystem-dev.config.js" ]
