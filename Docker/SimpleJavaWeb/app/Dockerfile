FROM centos:7
WORKDIR /opt/tcserver
ENV CATALINA_HOME /opt/tcserver/tomcat

RUN yum install -y java-1.8.0-openjdk wget \
    && wget http://mirrors.koehn.com/apache/tomcat/tomcat-8/v8.5.24/bin/apache-tomcat-8.5.24.tar.gz \
    && tar xvzf apache-tomcat-8.5.24.tar.gz \
    && ln -s apache-tomcat-8.5.24 tomcat \
    && rm -rf ./tomcat/webapps/*

COPY ./SimpleJavaWebApp/target/SimpleWebApp.war ./tomcat/webapps/ROOT.war
COPY ./entrypoint.sh ./

EXPOSE 8080
CMD ["./entrypoint.sh"]
