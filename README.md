# wifi-password

> People ask you for the Wi-Fi password. Answer quickly.

Get the password of the current or specified WiFi network (macOS only).

## Installation

```
bash -c "$(curl -fsSL https://github.com/uncenter/wifi-password/raw/master/install.sh)"
```

<details>
<summary>Manual installation</summary>
<ol>
<li>Download <a href="https://raw.githubusercontent.com/uncenter/wifi-password/master/wifi-password.sh"><code>wifi-password.sh</code></a> and move it to <code>/usr/local/bin/wifi-password</code> (you may need <code>sudo</code>).</li>
<li>Make `wifi-password` executable (e.g. <code>chmod +x /usr/local/bin/wifi-password</code>).</li>
</ol>
</details>

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
