FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive
 
ENV PGDATA=/var/lib/postgresql/data/pgdata
ENV PG_HOST=0.0.0.0
ENV PG_PORT=5432
ENV IG_DATABASE=image_gallery
ENV IG_USER=dongji
ENV IG_PASSWD_FILE=cpsc4973


RUN apt-get update -y && apt install default-jre -y 
RUN mkdir /java-image-gallery
COPY .  /java-image-gallery

WORKDIR /java-image-gallery

CMD [ "java", "-jar", "java-image-gallery-all.jar"] 




