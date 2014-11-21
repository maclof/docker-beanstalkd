FROM phusion/baseimage:latest
MAINTAINER maclof@gmail.com
RUN apt-get -y update
RUN apt-get -y install wget build-essential
RUN wget https://github.com/kr/beanstalkd/archive/v1.10.tar.gz
RUN tar -zxf v1.10.tar.gz
WORKDIR beanstalkd-1.10
RUN make
RUN cp beanstalkd /usr/bin/beanstalkd
EXPOSE 11300
CMD ["beanstalkd", "-p", "11300"]