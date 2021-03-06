FROM python:3-alpine

LABEL maintainer="demotascha@gmail.com"

ENV VERSION master

RUN apk add --no-cache sudo openssl git ca-certificates

RUN cd /opt \
    && git clone -b ${VERSION} --single-branch https://opendev.org/jjb/jenkins-job-builder.git \
    && cd /opt/jenkins-job-builder \
    && pip install -r requirements.txt \
    && python setup.py install \
    && mkdir /.cache && chmod 777 /.cache \
    && rm -R /opt/jenkins-job-builder

ENTRYPOINT ["/usr/local/bin/jenkins-jobs"]
