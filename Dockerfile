FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive
 
ENV PGDATA=/var/lib/postgresql/data/pgdata
ENV PG_HOST=m5-ig-rds.cy7qnq8x0c88.us-east-2.rds.amazonaws.com
ENV PG_PORT=5432
ENV IG_DATABASE=image-gallery
ENV IG_USER=dongji
ENV IG_PASSWD_FILE=cpsc4973

RUN apt-get update -y && apt install default-jre -y 
RUN mkdir /java-image-gallery
COPY .  /java-image-gallery

WORKDIR /java-image-gallery

RUN chmod +x createDB.sh
RUN createDB.sh

CMD [ "java", "-jar", "java-image-gallery-all.jar"] 




