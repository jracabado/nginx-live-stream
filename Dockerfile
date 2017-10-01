FROM nginx:alpine

RUN apk add --no-cache openssl ca-certificates nginx nginx-mod-rtmp ffmpeg \
    && npm install --save-dev video.js \
    && mkdir -p /var/rec

ADD nginx.conf /etc/nginx/conf/nginx.conf
ADD stat.xsl /etc/nginx/conf/static/stat.xsl

VOLUME /var/rec
EXPOSE 80 1935

CMD nginx -g daemon off;
