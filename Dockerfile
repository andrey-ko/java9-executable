# generated, do not modify 
FROM debian:sid

RUN apt-get update
RUN rm -rf /var/lib/apt/lists/*

#RUN yum -y update
#RUN yum clean all

# copy app files
ADD dist-linux/ /app/
RUN chmod +x /app/bin/java

# cleanup
RUN rm -fr /tmp

# default command to execute when creating a new container
WORKDIR /app
ENTRYPOINT ["bin/java", "-m", "mymodule/org.andreyko.j9exec.App"]