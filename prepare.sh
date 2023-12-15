update_agent(){
    # find docker container id by name and save it to a variable
    containerId=$(docker ps -a | grep "wazuh-agent" | awk '{print $1}')
    echo $containerId
    # run docker exec command to execute agent update
    docker exec -it $containerId sh -c "cat /tmp/config/ossec.conf > /var/ossec/etc/ossec.conf"
    docker exec -it $containerId sh -c "touch /var/log/maltiverse-test.log"

    # restart agent
    docker exec -it $containerId sh -c "service wazuh-agent restart"
}

update_manager(){
    containerId=$(docker ps -a | grep "wazuh-manager" | awk '{print $1}')
    echo $containerId
    docker exec -it $containerId sh -c "cat /tmp/config/ossec.conf > /var/ossec/etc/ossec.conf"
    docker exec -it $containerId sh -c "cat /tmp/config/local_decoder.xml > /var/ossec/etc/decoders/local_decoder.xml"
    docker exec -it $containerId sh -c "cat /tmp/config/local_rules.xml > /var/ossec/etc/rules/local_rules.xml"
    docker exec -it $containerId sh -c "service wazuh-manager restart"
}

update_agent
update_manager