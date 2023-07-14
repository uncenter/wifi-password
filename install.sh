#!/usr/bin/env bash
set -eo pipefail

install_dir="${1:-/usr/local/bin}"
script_url="https://raw.githubusercontent.com/uncenter/wifi-password/master/wifi-password.sh"

if [[ $(uname -s) != "Darwin" ]]; then
    echo "This installation script is intended for macOS only."
    exit 1
fi

[ -f "$install_dir/wifi-password" ] && echo "wifi-password is already installed." && exit 1

file="wifi-password-$(date +%s%N).sh"
curl -sS -o "$file" "$script_url"
echo "Installing wifi-password in $install_dir. You may be asked for your password."
chmod +x "$file"
sudo mv "$file" "$install_dir/wifi-password" && echo "Installed! Run \`wifi-password --help\` for usage. " || echo "Installation failed."