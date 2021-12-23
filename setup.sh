#/usr/bin/env bash

check_root() {
  if [ $(whoami) != "root" ]
  then
    echo ":::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
    echo "######### This script must be executed as root! #########"
    echo ":::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
    exit 1
  fi
}



echo ":::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
echo "::::::::::::: Setup Script For $(lsb_release -d -s) ::::::::::::::"
echo ":::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
echo ""
echo ""
echo "This setup is meant for developers"
echo ""
echo ""

check_root

apt update
apt upgrade -y
apt autoremove


echo "Installing VSCode"
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" | tee /etc/apt/sources.list.d/vscode.list
apt install code -y
echo "VSCode installed"