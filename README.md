# Threat-Visibility-Configs

This repository contains docker configurations for a combination of Wazuh `PoC`s. Different types of attacks are emulated on a docker container to see how Wazuh detects them.

Currently, the following `PoC`s are available:
- SQL Injection attack detection
- Shellshock attack detection
- Malware detection using Yara
- IPv4 monitoring using Maltiverse
- Hostname monitoring using Maltiverse
- URL monitoring using Maltiverse
- File Hash monitoring using Maltiverse

## How to use
- Clone this repository
```bash
git clone git@github.com:pptx704/threat-visibility-configurations.git
```
- Install Docker and Docker Compose
```bash
sudo apt install docker.io docker-compose
```
- Increase the `vm.max_map_count` kernel setting
```bash
sudo sysctl -w vm.max_map_count=262144
```
- Generate SSL certificates for the Wazuh server
```bash
docker-compose -f generate-indexer-certs.yml run --rm generator
```
- Start the Docker containers
```bash
docker-compose up -d
```
- Prepare the Wazuh manager and the Wazuh agent for the `PoC`s
```bash
source prepare.sh
```
- Emulate the attacks
```bash
source run.sh
```