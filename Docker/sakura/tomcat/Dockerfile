FROM centos:7
RUN yum install -y java
ADD apache-tomcat-9.0.27.tar.gz /opt/
CMD [ "/opt/apache-tomcat-9.0.27/bin/catalina.sh", "run" ]
