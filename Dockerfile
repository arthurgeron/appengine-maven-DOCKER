FROM google/cloud-sdk:latest
MAINTAINER Arthur Geron <johnnyblack000@hotmail.com>

USER root

RUN apt-get update && \
        apt-get install -y \
        software-properties-common  && \
        add-apt-repository ppa:webupd8team/java && \
        apt-get update && \
        add-apt-repository ppa:andrei-pozolotin/maven3 && \
        apt-get update && \
        apt-get install -y oracle-java8-installer maven3 && \
        apt-get clean

CMD [ "/bin/bash" ]