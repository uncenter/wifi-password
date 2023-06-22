#!/usr/bin/env sh

version="1.0.0"

airport="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport"
if [ ! -f $airport ]; then
    echo "ERROR: Can't find \`airport\` CLI program at \"$airport\"."
    exit 1
fi

if [ -t 1 ]; then
    verbose=1
else
    verbose=
fi

usage() {
    cat <<EOF

wifi-password - get the password of the current or specified WiFi network [version $version]

Usage:	wifi-password [options] [ssid]

Options:
	-q, --quiet      Only output the password.
	-V, --version    Output version.
	-h, --help       This message.

Example:
	wifi-password
	wifi-password | pbcopy
	wifi-password MyWiFiNetwork
EOF
}

while [[ "$1" =~ ^- && ! "$1" == "--" ]]; do
    case $1 in
        -V | --version )
            echo $version
            exit
        ;;
        -q | --quiet )
            verbose=
        ;;
        -h | --help )
            usage
            exit
        ;;
    esac
    shift
done
if [[ "$1" == "--" ]]; then shift; fi

# Merge args for SSIDs with spaces.
args="$@"

# Check for user-provided SSID.
if [ "" != "$args" ]; then
    ssid="$@"
else
    # Get current SSID.
    ssid="`$airport -I | awk '/ SSID/ {print substr($0, index($0, $2))}'`"
    if [ "$ssid" = "" ]; then
        echo "ERROR: Could not retrieve current SSID. Are you connected?" >&2
        exit 1
    fi
fi

# Warn user about keychain dialog.
if [ $verbose ]; then
    echo "Getting password for \"$ssid\"..."
    echo "Keychain prompt incoming."
    sleep 1
fi

# Via: http://blog.macromates.com/2006/keychain-access-from-shell/
pwd="`security find-generic-password -D 'AirPort network password' -ga \"$ssid\" 2>&1 >/dev/null`"

if [[ $pwd =~ "could" ]]; then
    echo "ERROR: Could not find SSID \"$ssid\"" >&2
    exit 1
fi

pwd=$(echo "$pwd" | sed -e "s/^.*\"\(.*\)\".*$/\1/")

if [ "" == "$pwd" ]; then
    echo "ERROR: Could not get password. Did you enter your Keychain credentials?" >&2
    exit 1
fi

if [ $verbose ]; then
    echo "Password for \"$ssid\": \"$pwd\""
else
    echo $pwd
fi
