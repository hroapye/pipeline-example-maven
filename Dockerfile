FROM tomcat:8.5 AS cache

ADD target/greenhouse-1.0.0.BUILD-SNAPSHOT.war /tmp/root.war
RUN mkdir /tmp/root && \
    cd /tmp/root && \
    jar xf /tmp/root.war

FROM tomcat:8.5

COPY --from=cache /tmp/root /usr/local/tomcat/webapps/ROOT

CMD ["catalina.sh", "run"]
