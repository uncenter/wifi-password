# wifi-password

> People ask you for the Wi-Fi password. Answer quickly.

Get the password of the current or specified WiFi network (macOS only).

## Installation

```sh
curl -fsSL https://github.com/uncenter/wifi-password/raw/master/install.sh | sh
```

Installs to `/usr/local/bin` (all users) by default. You can specify a custom directory by appending `-s <dir>` to the install command. For example, to install to `$HOME/.local/bin`:

```sh
curl -fsSL https://github.com/uncenter/wifi-password/raw/master/install.sh | sh -s "$HOME/.local/bin"
```

## Usage

View all options:

```
$ wifi-password --help
```

To get the password for the current WiFi network:

```
$ wifi-password
```

To get it for a specific SSID/network:

```
$ wifi-password <ssid>
```

To only get the password (useful with `pbcopy` for example):

```
$ wifi-password --quiet
```

## License

MIT
