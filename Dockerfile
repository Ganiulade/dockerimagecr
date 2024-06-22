ARG VERSION=20.04
FROM ubuntu:${VERSION}
MAINTAINER "Olawale ganiulade@yahoo.ca"
RUN apt update && apt install -y nginx curl
COPY index.html /usr/share/nginx/html
COPY index.html /var/www/html
EXPOSE 80
VOLUME /var/www/html
CMD ["nginx", "-g", "daemon off;"]
HEALTHCHECK CMD curl --fail http://localhost:80/ || exit 1
