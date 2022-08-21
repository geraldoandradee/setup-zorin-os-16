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
apt install ansible git-core -y

cd
git clone https://github.com/geraldoandradee/setup-zorin-os-16.git
cd setup-zorin-os-16
ansible-playbook setup.yml -i hosts.ini
rm -rf setup-zorin-os-16
