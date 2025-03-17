#!/bin/bash

# Define color codes
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
NC='\033[0m' # No Color - used to reset

echo -e "${YELLOW}Setting up development environment for Ubuntu 24.04, Part 1"

# 1. Install Oracle VM VirtualBox
echo -e "1. Install Oracle VM VirtualBox${NC}"

# Credit: https://www.linuxtechi.com/how-to-install-virtualbox-in-ubuntu/comment-page-1/
# Update System Package Cache
echo -e "${BLUE}1.1. Update system package cache...${NC}"
sudo apt update
sudo apt upgrade -y

# Add VirtualBox APT Repository
echo -e "${BLUE}1.2. Adding VirtualBox APT repository...${NC}"
sudo apt install curl wget gnupg2 lsb-release -y
curl -fsSL https://www.virtualbox.org/download/oracle_vbox_2016.asc|sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/vbox.gpg
curl -fsSL https://www.virtualbox.org/download/oracle_vbox.asc|sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/oracle_vbox.gpg
echo "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list

# Install VirtualBox on Ubuntu 24.04
echo -e "${BLUE}1.3. Installing VirtualBox...${NC}"
sudo apt update
sudo apt install -y linux-headers-$(uname -r) dkms
sudo apt install virtualbox-7.0 -y

# Add Your Local User to VBoxusers Group
echo -e "${BLUE}1.4. Adding user to vboxusers group...${NC}"
echo -e "${GREEN}After this, run ./backup_2.sh after first converting it to an executable file using chmod +x backup_2.sh${NC}"
sudo usermod -aG vboxusers $USER
newgrp vboxusers

