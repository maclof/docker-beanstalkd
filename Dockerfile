FROM debian
MAINTAINER maclof@gmail.com

# Install the required software.
RUN apt-get -y update \
 && apt-get -y install wget build-essential

# Set the environment variables.
ENV BEANSTALKD_VERSION 1.10

# Download and extract the source code.
RUN wget --no-check-certificate https://github.com/kr/beanstalkd/archive/v$BEANSTALKD_VERSION.tar.gz \
 && tar -zxf v$BEANSTALKD_VERSION.tar.gz

# Change the working directory.
WORKDIR beanstalkd-$BEANSTALKD_VERSION

# Build the software.
RUN make \
 && cp beanstalkd /usr/bin/beanstalkd

# Expose the ports.
EXPOSE 11300

# Set the launch command.
CMD ["beanstalkd", "-p", "11300"]
