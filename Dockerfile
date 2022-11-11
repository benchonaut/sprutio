FROM python
MAINTAINER "Maksim Losev <mlosev@beget.ru>"

#ADD https://github.com/just-containers/s6-overlay/releases/download/v1.11.0.1/s6-overlay-amd64.tar.gz /tmp/
#RUN tar xzf /tmp/s6-overlay-amd64.tar.gz -C /
RUN /bin/bash -c "uname -m|grep ^aarch64 && (cd /;wget -c https://github.com/just-containers/s6-overlay/releases/download/v3.1.2.1/s6-overlay-aarch64.tar.xz -O -|tar xz)"||true
RUN /bin/bash -c "uname -m|grep ^x86_64 &&  (cd /;wget -c https://github.com/just-containers/s6-overlay/releases/download/v3.1.2.0/s6-overlay-x86_64.tar.xz  -O -|tar xz)"||true



ENTRYPOINT ["/init"]

RUN apt-get update -qq && \
    apt-get install --no-install-recommends -qq -y \
        libacl1-dev \
        libarchive-dev

ENV S6_BEHAVIOUR_IF_STAGE2_FAILS 2
