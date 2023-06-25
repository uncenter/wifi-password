#!/usr/bin/env bash

if [[ $(uname -s) != "Darwin" ]]; then
    echo "This installation script is intended for macOS only."
    exit 1
fi

if [ -f "/usr/local/bin/wifi-password" ]; then
    echo "wifi-password is already installed."
    exit 1
fi

curl -o wifi-password.sh https://raw.githubusercontent.com/uncenter/wifi-password/master/wifi-password.sh

chmod +x wifi-password.sh

sudo mv wifi-password.sh /usr/local/bin/wifi-password && echo "Installation complete. You can now use wifi-password!" || echo "Installation failed."
