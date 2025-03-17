#!/bin/bash

# Define color codes
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
NC='\033[0m' # No Color - used to reset

echo -e "${YELLOW}Setting up development environment for Ubuntu 24.04, Part 2${NC}"

# 1.5. Install VirtualBox Extension Pack
echo -e "${YELLOW}1.5. Installing VirtualBox Extension Pack...${NC}"
wget https://download.virtualbox.org/virtualbox/7.0.18/Oracle_VM_VirtualBox_Extension_Pack-7.0.18.vbox-extpack
sudo vboxmanage extpack install Oracle_VM_VirtualBox_Extension_Pack-7.0.18.vbox-extpack



# 2. Install Vim
echo -e "${YELLOW}2. Installing Vim ...${NC}"
sudo apt-get install -y vim



# 3. Install DB Browser for SQLite
echo -e "${YELLOW}3. Installing DB Browser for SQLite ...${NC}"
sudo apt-get install -y sqlitebrowser



# 4. Install the Gnome Extension Manager (for Windows Tiling)
echo -e "${YELLOW}4. Installing Gnome Shell Extension Manager...${NC}"
sudo apt-get install -y gnome-shell-extension-manager



# 5. Install Gnote
echo -e "${YELLOW}5. Installing Gnote...${NC}"
sudo apt-get install -y gnote



# 6. Install VSCode
echo -e "${YELLOW}6. Installing VSCode...${NC}"
sudo snap install code --classic



# 7. Install Postman
echo -e "${YELLOW}7. Installing Postman...${NC}"
sudo snap install postman



# 8. Install GitHub Desktop
echo -e "${YELLOW}8. Installing GitHub Desktop...${NC}"
echo -e "${BLUE}8.1. Getting APT Packages...${NC}"
wget -qO - https://apt.packages.shiftkey.dev/gpg.key | gpg --dearmor | sudo tee /usr/share/keyrings/shiftkey-packages.gpg > /dev/null
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/shiftkey-packages.gpg] https://apt.packages.shiftkey.dev/ubuntu/ any main" > /etc/apt/sources.list.d/shiftkey-packages.list'
echo -e "${BLUE}8.2. Installing...${NC}"
sudo apt update && sudo apt install -y github-desktop



# 9. Install PostgreSQL
echo -e "${YELLOW}9. Installing PostgreSQL and PGAdmin4...${NC}"

# 9.1. Install PostgreSQL server and client tools
echo -e "${BLUE}9.1. Installing PostgreSQL server and client tools...${NC}"
sudo apt update
sudo apt install -y postgresql postgresql-contrib

# 9.2. Start PostgreSQL
echo -e "${BLUE}9.2. Start PostgreSQL and set it to start automatically on login${NC}"
sudo systemctl start postgresql
sudo systemctl enable postgresql

# 9.3. Set up the pgAdmin 4 repository
echo -e "${BLUE}9.3. Set up the pgAdmin 4 repository${NC}"
sudo apt install -y curl gnupg2
curl -fsS https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo gpg --dearmor -o /usr/share/keyrings/packages-pgadmin-org.gpg

# 9.4. Add pgAdmin 4 repository to apt sources
echo -e "${BLUE}9.4. Add pgAdmin 4 repository to apt sources${NC}"
sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/packages-pgadmin-org.gpg] https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list'

# 9.5. Update package lists
echo -e "${BLUE}9.5. Update package lists${NC}"
sudo apt update

# 9.6. Install pgAdmin 4 desktop version
echo -e "${BLUE}9.6. Install pgAdmin 4 desktop version${NC}"
sudo apt install -y pgadmin4-desktop

# 9.7. Manual Configuration
echo -e "${BLUE}9.7. Manual Configuration of PostgreSQL and pgAdmin 4${NC}"
echo "Run the following:"
echo "Verify PostgreSQL installation and status"
echo "sudo systemctl status postgresql"
echo "Next, complete the remaining steps"
echo "sudo -u postgres psql"
echo "ALTER USER postgres WITH PASSWORD 'your_password_here';"
echo "The ';' at the end is important. You should see 'ALTER ROLE'"
echo "\q"
echo "sudo nano /etc/postgresql/*/main/postgresql.conf"
echo "Add line listen_addresses = '*'"
echo "sudo systemctl restart postgresql"
echo "Now open pgAdmin 4 and create a new Server"
echo "Set localhost as the host"
echo "Provide password as set above"
echo "Now you are ready to create database tables and use PostgreSQL with pgAdmin 4"


# Next Steps
echo -e "${GREEN}All main installations are over."
echo "You may need to log out and log back in for the group membership to take effect."
echo "Start VirtualBox: To start virtualbox GUI, click on Workspace and then search virtualbox"
echo "Click on VirtualBox icon. The installation is successful if you see the window pop open."
echo "Now head back to VirtualBox GUI. From the File menu choose Tools and then click on Extensions Pack Manager"
echo "Now, download/bring Windows 10 and/or other ISO Image(s) and create Virtual Machines"
echo "Note that for Windows, while creating the Machine, check the Skip Unattended Installation box as Product Key is not available"
echo "List of Applications Installed:"
echo "1. Oracle VM VirtualBox"
echo "2. Vim"
echo "3. DB Browser for SQLite"
echo "4. Gnome Extension Manager"
echo "5. Gnote"
echo "6. VS Code"
echo "7. Postman"
echo "8. GitHub Desktop"
echo "9. PostgreSQL with pgAdmin 4"
echo "For VS Code, the following extensions need to be installed manually: "
echo "6.1. Python"
echo "6.2. Jupyter"
echo "6.3. ESLint"
echo "Also, in VS Code, disable auto inline ai suggestions and also enable autosave of code."
echo "ALso, ensure that WinTile extension is installed from the Extension Manager"
echo "And finally, run this command: gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'"
echo "It will enable a window to be minimized by clicking on the icon in the dock, like in Windows"
echo -e "Ensure that you find these applications. Hari Om.${NC}"


