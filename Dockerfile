FROM google/cloud-sdk:latest
MAINTAINER Arthur Geron <johnnyblack000@hotmail.com>

USER root

RUN apt-get update && \
        apt-get install -y \
        software-properties-common
RUN add-apt-repository ppa:andrei-pozolotin/maven3 -y
RUN add-apt-repository ppa:webupd8team/java -y && apt-get update
RUN apt-get install -y oracle-java8-installer maven3

CMD [ "/bin/bash" ]