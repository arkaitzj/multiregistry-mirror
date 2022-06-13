FROM nginx:1.21.6

RUN mkdir -p /data/nginx/cache
COPY conf/nginx.conf /etc/nginx/nginx.conf
