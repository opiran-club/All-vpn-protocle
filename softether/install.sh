#!/bin/bash
check_if_running_as_root() {
    # If you want to run as another user, please modify $EUID to be owned by this user
    if [[ "$EUID" -ne '0' ]]; then
        echo "$(tput setaf 1)Error: You must run this script as root!$(tput sgr0)"
        exit 1
    else
        echo $(tput setaf 2)softether installing starting ...$(tput sgr0)
    fi
}

check_os() {
    # Get the operating system name and version
    OS=$(lsb_release -si)
    VERSION=$(lsb_release -sr)

    # Check if the OS is Ubuntu 
    if [ "$OS" != "Ubuntu" ] ; then
        echo $(tput setaf 1)This script only works on Ubuntu $(tput sgr0)
        exit 1
    fi
}
sysup() {
    bash <(curl -s https://raw.githubusercontent.com/samsesh/Ubuntu-Optimizer/main/ubuntu-optimizer.sh)
}

req() {
    #install softether requirement
    apt install -y figlet
    clear
    figlet installing requirement
    sleep 5
    apt install -y build-essential make gcc zlib1g-dev libreadline-dev libncurses-dev libssl-dev
    clear
}

install() {
    #install softether - start
    figlet installing softether
    # download softether
    wget https://github.com/SoftEtherVPN/SoftEtherVPN_Stable/releases/download/v4.38-9760-rtm/softether-vpnserver-v4.38-9760-rtm-2021.08.17-linux-x64-64bit.tar.gz
    #extart file
    tar xzf softether-vpnserver-v4.38-9760-rtm-2021.08.17-linux-x64-64bit.tar.gz
    # compiling softether
    cd vpnserver/
    make
    cd ..
    clear
    # move to new dir
    mv vpnserver /usr/local
    cd /usr/local/vpnserver/
    # get file permission
    chmod 600 *
    chmod 700 vpnserver vpncmd
    # start server
    /usr/local/vpnserver/vpnserver start
    # enable ip4 forward
    ln -s /usr/local/vpnserver/vpnserver /usr/bin/vpnserver
    ln -s /usr/local/vpnserver/vpncmd /usr/bin/vpncmd
    echo net.ipv4.ip_forward = 1 | ${SUDO} tee -a /etc/sysctl.conf
    # create vpn server service
    cp vpnserver.service /lib/systemd/system/
    # start vpn server service
    systemctl start vpnserver.service
    # add to start up vpn server service
    systemctl enable vpnserver.service

    /usr/local/vpnserver/vpncmd

    clear
    figlet finish
    echo "samsesh"
    #install softether - end

    echo "now run vpncmd and select ro service then for set password on use this command on vpncmd ServerPasswordSet"

    sleep 5

    echo "check your service status"
    echo "systemctl status vpnserver.service"
}

#run
check_os
check_if_running_as_root
sysup
req
install
