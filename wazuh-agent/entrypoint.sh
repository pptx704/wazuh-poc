#!/bin/bash
# Install YARA rules
mkdir -p /tmp/yara/rules
curl 'https://valhalla.nextron-systems.com/api/v1/get' \
-H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' \
-H 'Accept-Language: en-US,en;q=0.5' \
--compressed \
-H 'Referer: https://valhalla.nextron-systems.com/' \
-H 'Content-Type: application/x-www-form-urlencoded' \
-H 'DNT: 1' -H 'Connection: keep-alive' -H 'Upgrade-Insecure-Requests: 1' \
--data 'demo=demo&apikey=1111111111111111111111111111111111111111111111111111111111111111&format=text' \
-o /tmp/yara/rules/yara_rules.yar

# Activate YARA active response
cp /yara.sh /var/ossec/active-response/bin/yara.sh
chown root:wazuh /var/ossec/active-response/bin/yara.sh
chmod 750 /var/ossec/active-response/bin/yara.sh

#Add the following within the <syscheck> block of the Wazuh agent /var/ossec/etc/ossec.conf configuration file to monitor the /tmp/yara/malware directory:
# <directories realtime="yes">/tmp/yara/malware</directories>

service wazuh-agent start

# Yara attack emulation
mkdir -p /tmp/yara/malware
chmod +x /malware_downloader.sh

# apache2
service apache2 start

sleep infinity