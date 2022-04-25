FROM openjdk:8-jre-alpine

RUN echo "Asia/shanghai" > /etc/timezone
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
       apk add --update ttf-dejavu fontconfig && \
       rm -rf /var/cache/apk/*

RUN mkdir /app
WORKDIR /app
ADD *.jar /app/app.jar
EXPOSE 8080

ENV JAVA_OPTS="-Dfile.encoding=UTF-8  -Djava.security.egd=file:/dev/./urandom"
ENV JVM_OPTS="-Xmx2048M -Xms2048M -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/app/"
#ENV JVM_OPTS="-XX:+PrintGC -Xloggc:/app/gc.log -Xmx2048M -Xms2048M -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/app/"
ENV LOG_OPTS="-Dlogging.path=/app/log/ -Dlogback.loglevel=INFO"
ENV BOOT_ENV="dev"
ENV BOOT_OPTS=""
ENV EXT_OPTS=""
ENV APP_NAME='xx-api'

ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS $LOG_OPTS $JVM_OPTS -jar /app/app.jar --spring.application.name=$APP_NAME --server.port=8080 --spring.profiles.active=$BOOT_ENV $BOOT_OPTS $EXT_OPTS" ]