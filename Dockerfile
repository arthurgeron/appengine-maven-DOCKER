FROM ubuntu:latest
MAINTAINER Arthur Geron <johnnyblack000@hotmail.com>

USER root

RUN apt-get update && \
        apt-get install -y \
        software-properties-common \
        curl \
        gcc \
        python-dev \
        python-setuptools \
        apt-transport-https \
        lsb-release \
        openssh-client \
        git && \
        echo "deb https://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" > /etc/apt/sources.list.d/google-cloud-sdk.list && \
        curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
        apt-get update && \
        apt-get install -y google-cloud-sdk \
        google-cloud-sdk-app-engine-java \
        add-apt-repository ppa:webupd8team/java && \
        apt-get update && \
        add-apt-repository ppa:andrei-pozolotin/maven3 && \
        apt-get update && \
        apt-get install -y oracle-java8-installer maven3 && \
        apt-get clean && \
        gcloud config set core/disable_usage_reporting true && \
        gcloud config set component_manager/disable_update_check true && \
        gcloud config set metrics/environment github_docker_image
