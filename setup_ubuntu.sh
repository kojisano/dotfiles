#!/bin/bash

setup_ubuntu() {
    if [[ ! -f /etc/os-release ]]; then
        return 0
    fi

    sudo sed -i.bak -e "s%https?://[^ ]\+%https://ftp.udx.icscoe.jp/Linux/ubuntu/%g" /etc/apt/sources.list
    sudo apt-get update
}

setup_ubuntu

exit 0