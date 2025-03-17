# ubuntu-app-install
This repository is a set of BASH scripts to ease the process of setting up your development computer. We plan to cover multiple types of insatallations, based on the requirements of different types of developer roles (Basic Developer, AI/ML Developer, JS Developer, etc.). Contributions are welcome.

# BASH Script Description
1. ```oracle_vbox_install.sh```: This BASH Script installs Oracle VM VirtualBox to your system. It is recommended for all types of developers. You can download the ISO image of an OS like WIndows, or even launch a Virtual Machine running the same OS as your computer! It has a functional usage though, and that is, in case you are unsure about the effect a process or command is going to produce in your computer, you can test it out in the Virtual Machine running the same OS. That way, in the worst case scenario, your data remains safe.
2. ```basic_developer_apps_install.sh```: This BASH Script installs the following apps required by Basic Developers:
   1. Vim
   2. DB Browser for SQLite.
   3. Gnome Extension Manager (useful for installing various extensions like WinTile, which allows quarter screen tiling like in Windows)
   4. Gnote (like 3M Sticky Notes)
   5. VS Code
   6. Postman
   7. GitHub Desktop
   8. PostgreSQL with pg Admin4
3. More upcoming

# Running Instructions
1. First, download the BASH script to the **home** directory.
2. Next, open Terminal using ```Ctrl+Alt+T``` and execute ```sudo chmod +x <file_name>.sh```
3. Finally, run ```./<file_name>/sh```
4. Check the Terminal Output to know about the progress and/or next steps needed to be taken

# Notes
1. The BASH scripts have been tested for Ubuntu 24.04 LTS
2. Some commands (like the ```snap``` commands to install VS Code) **do not** work for other Linux distros.
3. While installing Ubuntu 24.04 and later, it is recommended to go for the installation option that includes default apps like Libre Office, etc.

# Contributions
You are welcome to submit PR for adding a new BASH script suited for a particular developer role or for improving an existing BASH script. You are requested to follow the manner in which ```echo``` statements are written. This goes a long way to improve readability and reduce the monotonousness of line after line of white text, as well as to identify errors if any.

# Credits
We express our gratitude to the following sources:
1. [How to Install VirtualBox on Ubuntu 24.04](https://www.linuxtechi.com/how-to-install-virtualbox-in-ubuntu/)

# Support
Like this project? You can express your gratitude by starring this repository and/or following the contributors

Thank you. We hope you find this useful.
