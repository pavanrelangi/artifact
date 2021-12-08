FROM tomcat:9-alpine
WORKDIR /root/
ADD  http://18.116.241.57:8081/artifactory/sample_repo/artifact.war /usr/local/tomcat/webapps
RUN rm -f /usr/local/tomcat/conf/tomcat-user.xml
COPY tomcat-users.xml /usr/local/tomcat/conf/
RUN rm -f /usr/local/tomcat/webapps/manager/META-INF/context.xml
COPY context.xml /usr/local/tomcat/webapps/manager/META-INF/
EXPOSE 8080
CMD ["catalina.sh","run"]
