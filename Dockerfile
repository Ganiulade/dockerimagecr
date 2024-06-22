ARG VERSION=20.04
FROM ubuntu:${VERSION}
MAINTAINER "Olawale ganiulade@yahoo.ca"
LABEL environment=production
RUN apt update && apt install -y nginx curl
COPY index.html /usr/share/nginx/html
ENV MYSQL_ROOT_PASSWORD=test1234
COPY index.html /var/www/html
EXPOSE 80
VOLUME /var/www/html
CMD ["nginx", "-g", "daemon off;"]
HEALTHCHECK CMD curl --fail http://localhost:80/ || exit 1
