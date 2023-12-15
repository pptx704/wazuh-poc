# Download malware for Yara detection
agentId=$(docker ps -a | grep "wazuh-agent" | awk '{print $1}')
docker exec -it $agentId sh -c "/malware_downloader.sh"

# Maltiverse IPv4 Test
docker exec -it $agentId sh -c "echo \"Oct 17 09:28:28 Ubuntu-2204 sshd[4275]: PAM 2 more authentication failures; logname= uid=0 euid=0 tty=ssh ruser= rhost=218.92.0.25  user=root\" >> /var/log/maltiverse-test.log"
# Maltiverse hostname Test
docker exec -it $agentId sh -c "echo \"timestamp=Oct 18 15:25:12 identifier=abdullahgtrlab action=dns_query details=Querying DNS for hostname: dobreusluge.zauvijek.itsforever.net\" >> /var/log/maltiverse-test.log"
# Maltiverse URL Test
docker exec -it $agentId sh -c "echo \"Oct 17 14:55:30 proxy_server squid[1234]: 157730320.512 192.168.1.200 TCP_MISS/200 5124 GET https://vk.com/doc52355237_667082058?hash=SCtt4ltNCbu3lnYUwPGvIGmMakZCTQ0Yuj5qiGj1Uc0&dl=hil1F6PzYlnVsXsKpXdnyCyI9zVoEp3fH0XkDiKEhgk&api=1&no_preview=1 - DIRECT/vk.com text/html\" >> /var/log/maltiverse-test.log"
# Maltiverse File Hash Test


# Make SQL Injection and Shellshock attacks
managerId=$(docker ps -a | grep "wazuh-manager" | awk '{print $1}')
docker exec -it $agentId sh -c "curl -H \"User-Agent: () { :; }; /bin/cat /etc/passwd\" wazuh.agent"
docker exec -it $agentId sh -c "curl -H \"User-Agent: () { :; }; /bin/cat /etc/environment\" wazuh.agent"
docker exec -it $agentId sh -c "curl -XGET \"http://wazuh.agent/users/?id=SELECT+*+FROM+users\""