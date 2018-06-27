FROM debian:stable

ENV OPENFIRE_VERSION=4_2_3 
ENV OPENFIRE_DIR=/opt/openfire


RUN apt-get update \
&& apt-get -y install software-properties-common gnupg gnupg2 sudo wget \
&& add-apt-repository "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" \
&& apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886 \
&& apt-get update \
&& echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections \
&& apt-get -y install oracle-java8-installer \
&& apt-get clean \
&& echo "Downloading openfire_${OPENFIRE_VERSION}.tar.gz ..." \
&& wget --no-verbose "http://download.igniterealtime.org/openfire/openfire_${OPENFIRE_VERSION}.tar.gz" -O /tmp/openfire_${OPENFIRE_VERSION}.tar.gz \
&& tar -xvzf /tmp/openfire_${OPENFIRE_VERSION}.tar.gz -C /tmp \ 
&& mv /tmp/openfire /opt/ \
&& mkdir -p $OPENFIRE_DIR/conf.default/conf \
&& mkdir -p $OPENFIRE_DIR/conf.default/logs \
&& mkdir -p $OPENFIRE_DIR/conf.default/plugins \
&& mkdir -p $OPENFIRE_DIR/conf.default/security \
&& mkdir $OPENFIRE_DIR/embedded-db \
&& cp -rfp $OPENFIRE_DIR/logs/* $OPENFIRE_DIR/conf.default/logs/ \
&& cp -rfp $OPENFIRE_DIR/conf/* $OPENFIRE_DIR/conf.default/conf/ \
&& cp -rfp $OPENFIRE_DIR/plugins/* $OPENFIRE_DIR/conf.default/plugins/ \
&& cp -rfp $OPENFIRE_DIR/resources/security/* $OPENFIRE_DIR/conf.default/security/ \
&& useradd openfire -U -d $OPENFIRE_DIR \
&& chown openfire: $OPENFIRE_DIR -R \
&& rm -rf /var/lib/apt/lists/* \
&& rm -rf /var/cache/oracle-jdk8-installer \
&& apt-get remove --purge --auto-remove -y  ca-certificates \ 
&& rm -rf /tmp/openfire

COPY entrypoint.sh /sbin/entrypoint.sh
RUN chmod +x /sbin/entrypoint.sh

EXPOSE 3478/tcp 3479/tcp 5222/tcp 5223/tcp 5229/tcp 5275/tcp 5276/tcp 5262/tcp 5263/tcp 7070/tcp 7443/tcp 7777/tcp 9090/tcp 9091/tcp 10001/udp

ENTRYPOINT ["/sbin/entrypoint.sh"] 
 
