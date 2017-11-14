FROM ubuntu:latest
LABEL maintainer="Arthur Geron <johnnyblack000@hotmail.com>"

USER root

RUN apt-get update && \
        apt-get install -y \
        software-properties-common \
        curl \
        gcc \
        python-dev \
        libffi-dev \
        libssl-dev \
        python-setuptools \
        apt-transport-https \
        lsb-release \
        openssh-client \
        git && \
        apt-get install -y python-pip && \
        pip install pyopenssl && \
        export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)" && \
        echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
        curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
        wget -qO- https://cli-assets.heroku.com/install-ubuntu.sh | sh && \
        apt-get update && \
        apt-get install -y google-cloud-sdk \
        google-cloud-sdk-app-engine-java && \
        add-apt-repository ppa:webupd8team/java && \
        apt-get update && \
        echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | \
        /usr/bin/debconf-set-selections && \
        echo oracle-java7-installer shared/accepted-oracle-license-v1-1 seen true | \
        /usr/bin/debconf-set-selections && \
        apt-get install -y oracle-java8-installer maven && \
        apt-get clean && \
        gcloud config set core/disable_usage_reporting true && \
        gcloud config set component_manager/disable_update_check true && \
        gcloud config set metrics/environment github_docker_image
