FROM nginx:mainline-alpine

COPY default.conf /etc/nginx/conf.d/

ADD wildcard.key /etc/ssl/
ADD wildcard.pem /etc/ssl/
EXPOSE 443
