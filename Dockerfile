FROM ubuntu:19.10

ENV Z_VERSION="0.8.2"
ENV ZEPPELIN_ADDR="0.0.0.0"
ENV Z_HOME="/zeppelin"

RUN apt-get -y update && \
    apt-get install -y openjdk-8-jdk wget python3 python3-distutils libgomp1 && \
    apt-get autoclean && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN wget -O /tmp/get-pip.py https://bootstrap.pypa.io/get-pip.py
RUN python3 /tmp/get-pip.py
RUN pip3 install -U jupyter grpcio protobuf scipy pandas matplotlib tensorflow xgboost sklearn
RUN alias python=python3

RUN wget -O /tmp/zeppelin-${Z_VERSION}-bin-all.tgz http://archive.apache.org/dist/zeppelin/zeppelin-${Z_VERSION}/zeppelin-${Z_VERSION}-bin-all.tgz && \
    tar -zxvf /tmp/zeppelin-${Z_VERSION}-bin-all.tgz && \
    rm -rf /tmp/zeppelin-${Z_VERSION}-bin-all.tgz && \
    mv /zeppelin-${Z_VERSION}-bin-all ${Z_HOME}

RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 1

EXPOSE 8080

WORKDIR ${Z_HOME}
CMD ["bin/zeppelin.sh"]
