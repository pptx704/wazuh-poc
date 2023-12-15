FROM ubuntu:22.04

COPY ./ /

RUN apt-get update && apt-get install -y curl apt-transport-https lsb-release gnupg2 make gcc autoconf libtool libssl-dev pkg-config jq net-tools && chmod 750 /entrypoint.sh
RUN curl -s https://packages.wazuh.com/key/GPG-KEY-WAZUH | apt-key add -
RUN echo "deb https://packages.wazuh.com/4.x/apt/ stable main" | tee -a /etc/apt/sources.list.d/wazuh.list
ENV WAZUH_MANAGER="wazuh.manager"
RUN apt-get update && apt-get install -y wazuh-agent
RUN sed -i "s/^deb/#deb/" /etc/apt/sources.list.d/wazuh.list
RUN apt-get update

RUN curl -LO https://github.com/VirusTotal/yara/archive/v4.2.3.tar.gz && tar -xvzf v4.2.3.tar.gz -C /usr/local/bin/ && rm -f v4.2.3.tar.gz
RUN cd /usr/local/bin/yara-4.2.3/ && ./bootstrap.sh && ./configure && make && make install && make check

RUN apt install -y apache2 && service apache2 start

CMD /entrypoint.sh