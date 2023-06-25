# wifi-password

> People ask you for the Wi-Fi password. Answer quickly.

Get the password of the current or specified WiFi network.

## Installation

```
bash -c "$(curl -fsSL https://github.com/uncenter/wifi-password/raw/master/install.sh)"
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
