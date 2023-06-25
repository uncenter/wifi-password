#!/usr/bin/env bash

if [[ $(uname -s) != "Darwin" ]]; then
    echo "This installation script is intended for macOS only."
    exit 1
fi

if [ -f "/usr/local/bin/wifi-password" ]; then
    echo "wifi-password is already installed."
    read -r -n 1 -p "Do you want to [r]einstall, [u]ninstall, or [a]bort?" REPLY
    echo
    if [[ $REPLY =~ ^[Rr]$ ]]; then
        sudo rm /usr/local/bin/wifi-password
    elif [[ $REPLY =~ ^[Uu]$ ]]; then
        sudo rm /usr/local/bin/wifi-password
        exit 0
    else
        exit 0
    fi
fi

curl --silent --show-error --output wifi-password.sh https://raw.githubusercontent.com/uncenter/wifi-password/master/wifi-password.sh

chmod +x wifi-password.sh

sudo mv wifi-password.sh /usr/local/bin/wifi-password && echo "Installation complete. Run \`wifi-password --help\` for usage. " || echo "Installation failed."
