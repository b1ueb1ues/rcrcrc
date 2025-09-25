### wsl port
```
netsh interface portproxy add v4tov4 listenport=10808 listenaddress=0.0.0.0 connectport=10808 connectaddress=(wsl hostname -I)
netsh interface portproxy add v4tov4 listenport=10809 listenaddress=0.0.0.0 connectport=10809 connectaddress=(wsl hostname -I)
```
### ~/.wslconfig
```
[wsl2]
networkingMode=mirrored
```

linux utils
```
apt install neovim git curl net-tools
apt install synaptic apt-xapian-index tilix thunar 
```
```
file: thunar, polo-gtk(deprecated)
term: tilix
gnome application tweak: menulibre
```

windows utils
```
RudeWindowFixer   --nvidia overlay problem
DJV --framebyframe viewer
NirSoft WifiInfoView
kdenlive
zed
tabby
```

windows remove xbox gamebar
```
Get-AppxPackage Microsoft.XboxGamingOverlay | Remove-AppxPackage
```


```
dpkg --add-architecture i386

```

lost settings
```
sudo apt-get install --reinstall gnome-control-center
```


```
/etc/fonts/conf.d/64-language-selector-prefer.conf

%sudo  ALL=(ALL) NOPASSWD: ALL

git config --global --add http.proxy socks://127.0.0.1:10809

```

### frida problem
```
pm uninstall com.google.android.art
reboot
```

### disable-firefox-blocking-of-http-downloads
```
about:config 
dom.block_download_insecure
```

### bypass
```
127.0.0.1
192.168.*.*
::1
localhost
*.acgvideo.com
*.bilibili.com
*.xiaomi.com
*.taobao.com
*.178.com
*.nga.cn
*.youku.com
*.alicdn.com
*.ykimg.com
*.mmstat.com
*.cibntv.net
*.tbcache.com
*.bilivideo.com
*.mioffice.cn
*.xiaomi.com
*.jd.com
*.kongzhong.com
*.gitee.io
*.sina.com
*.weibo.com
*.sinajs.cn
*.wishingstarmoye.com
*.mihoyo.com
*.huluxia.com
*.bimiacg.com
*.myqcloud.com
*.hdslb.com
*.baidu.com
*.prts.wiki
*.qq.com
```


### ap vpn
```
IF=wlan1
IP=`ip route|grep $IF|awk '{print $1}'`
#IP=192.168.161.0/24

if [ -z $IP ]
then
echo no ap
return 0
fi

iptables --flush
iptables -t filter -F FORWARD
iptables -t nat -F POSTROUTING
iptables -t filter -I FORWARD -j ACCEPT
iptables -t nat -I POSTROUTING -j MASQUERADE
ip rule add from $IP lookup 61
ip route add default dev tun0 scope link table 61
ip route add $IP dev $IF scope link table 61
ip route add broadcast 255.255.255.255 dev $IF scope link table 61
```

### tether vpn
```
IF=rndis0
IP=`ip route|grep $IF|awk '{print $1}'`
#IP=192.168.71.0/24

if [ -z $IP ]
then
echo no ap
return 0
fi

iptables --flush
iptables -t filter -F FORWARD
iptables -t nat -F POSTROUTING
iptables -t filter -I FORWARD -j ACCEPT
iptables -t nat -I POSTROUTING -j MASQUERADE
ip rule add from $IP lookup 61
ip route add default dev tun0 scope link table 61
ip route add $IP dev $IF scope link table 61
ip route add broadcast 255.255.255.255 dev $IF scope link table 61
```

```
// windows sleep
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /V AwayModeEnabled /T REG_dWORD /D 0 /F
rundll32.exe powrprof.dll SetSuspendState Sleep

// linux sleep
vi /etc/default/grub
GRUB_CMDLINE_LINUX="quiet splash mem_sleep_default=deep"
update-grub

// linux key repeat reset problem
vi /etc/X11/xinit/xserverrc
exec /usr/bin/X -nolisten tcp -ardelay 300 -arinterval 25 "$@"

// linux key repeat reset problem 2
gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 22
gsettings set org.gnome.desktop.peripherals.keyboard delay 222
```

### windows git bash
```
# Start SSH Agent
#----------------------------

SSH_ENV="$HOME/.ssh/environment"

function run_ssh_env {
  . "${SSH_ENV}" > /dev/null
}

function start_ssh_agent {
  echo "Initializing new SSH agent..."
  ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
  echo "succeeded"
  chmod 600 "${SSH_ENV}"

  run_ssh_env;

  ssh-add ~/.ssh/id_rsa;
}

if [ -f "${SSH_ENV}" ]; then
  run_ssh_env;
  ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
    start_ssh_agent;
  }
else
  start_ssh_agent;
fi
```

### vscode-neovim restrict mode
```
Settings: search trust
Extensions: Support Untrusted Workspaces
click -> Edit in settings.json

"extensions.supportUntrustedWorkspaces": {
        "asvetliakov.vscode-neovim": {
            "supported": true
        },
},
```


### nvim windows shada problem
```
vim.opt.shadafile = "NONE" -- disable shada
```


### zed key
```json
[
  {
    "context": "Workspace",
    "bindings": {
      // "shift shift": "file_finder::Toggle"
    }
  },
  {
    "context": "Editor && vim_mode == normal",
    "bindings": {
      "space ;": "command_palette::Toggle",
      "space space": "command_palette::Toggle",
      "v v": "vim::ToggleVisualBlock",
      "space w": ["workspace::SendKeystrokes", ": w enter"],
      "space q": ["workspace::SendKeystrokes", ": q !"],
      "space w q": ["workspace::SendKeystrokes", ": w q"],
      "alt-o": ["workspace::SendKeystrokes", "ctrl-[ A { enter"],
      "alt-j": ["workspace::SendKeystrokes", "3 j"],
      "alt-k": ["workspace::SendKeystrokes", "3 k"]
    }
  },
  {
    "context": "Editor && vim_mode == insert",
    "bindings": {
      "ctrl-a": "editor::SelectAll",
      "alt-9": ["workspace::SendKeystrokes", "("],
      "alt-0": ["workspace::SendKeystrokes", ")"],
      "alt-[": ["workspace::SendKeystrokes", "{"],
      "alt-]": ["workspace::SendKeystrokes", "}"],
      "alt-i": ["workspace::SendKeystrokes", "( ) left"],
      "alt-o": ["workspace::SendKeystrokes", "ctrl-[ A { enter"]
    }
  },
  {
    "context": "Editor && vim_mode == visual",
    "bindings": {
      "ctrl-a": "editor::SelectAll",
      "alt-j": ["workspace::SendKeystrokes", "3 j"],
      "alt-k": ["workspace::SendKeystrokes", "3 k"]
    }
  },
  {
    "context": "Editor && !menu",
    "bindings": {
      "ctrl-c": "editor::Copy", // vim default: return to normal mode
      "ctrl-v": "editor::Paste" // vim default: visual block mode
    }
  }
]
```


### vscode-neovim send alt key  
```json
[
        { "key": "alt+a", "command": "vscode-neovim.send", "args": "<a-a>", "when": "editorTextFocus && neovim.init" },
        { "key": "alt+b", "command": "vscode-neovim.send", "args": "<a-b>", "when": "editorTextFocus && neovim.init" },
        { "key": "alt+c", "command": "vscode-neovim.send", "args": "<a-c>", "when": "editorTextFocus && neovim.init" },
        { "key": "alt+d", "command": "vscode-neovim.send", "args": "<a-d>", "when": "editorTextFocus && neovim.init" },
        { "key": "alt+e", "command": "vscode-neovim.send", "args": "<a-e>", "when": "editorTextFocus && neovim.init" },
        { "key": "alt+f", "command": "vscode-neovim.send", "args": "<a-f>", "when": "editorTextFocus && neovim.init" },
        { "key": "alt+g", "command": "vscode-neovim.send", "args": "<a-g>", "when": "editorTextFocus && neovim.init" },
        { "key": "alt+h", "command": "vscode-neovim.send", "args": "<a-h>", "when": "editorTextFocus && neovim.init" },
        { "key": "alt+i", "command": "vscode-neovim.send", "args": "<a-i>", "when": "editorTextFocus && neovim.init" },
        { "key": "alt+j", "command": "vscode-neovim.send", "args": "<a-j>", "when": "editorTextFocus && neovim.init" },
        { "key": "alt+k", "command": "vscode-neovim.send", "args": "<a-k>", "when": "editorTextFocus && neovim.init" },
        { "key": "alt+l", "command": "vscode-neovim.send", "args": "<a-l>", "when": "editorTextFocus && neovim.init" },
        { "key": "alt+m", "command": "vscode-neovim.send", "args": "<a-m>", "when": "editorTextFocus && neovim.init" },
        { "key": "alt+n", "command": "vscode-neovim.send", "args": "<a-n>", "when": "editorTextFocus && neovim.init" },
        { "key": "alt+o", "command": "vscode-neovim.send", "args": "<a-o>", "when": "editorTextFocus && neovim.init" },
        { "key": "alt+p", "command": "vscode-neovim.send", "args": "<a-p>", "when": "editorTextFocus && neovim.init" },
        { "key": "alt+q", "command": "vscode-neovim.send", "args": "<a-q>", "when": "editorTextFocus && neovim.init" },
        { "key": "alt+r", "command": "vscode-neovim.send", "args": "<a-r>", "when": "editorTextFocus && neovim.init" },
        { "key": "alt+s", "command": "vscode-neovim.send", "args": "<a-s>", "when": "editorTextFocus && neovim.init" },
        { "key": "alt+t", "command": "vscode-neovim.send", "args": "<a-t>", "when": "editorTextFocus && neovim.init" },
        { "key": "alt+u", "command": "vscode-neovim.send", "args": "<a-u>", "when": "editorTextFocus && neovim.init" },
        { "key": "alt+v", "command": "vscode-neovim.send", "args": "<a-v>", "when": "editorTextFocus && neovim.init" },
        { "key": "alt+w", "command": "vscode-neovim.send", "args": "<a-w>", "when": "editorTextFocus && neovim.init" },
        { "key": "alt+x", "command": "vscode-neovim.send", "args": "<a-x>", "when": "editorTextFocus && neovim.init" },
        { "key": "alt+y", "command": "vscode-neovim.send", "args": "<a-y>", "when": "editorTextFocus && neovim.init" },
        { "key": "alt+z", "command": "vscode-neovim.send", "args": "<a-z>", "when": "editorTextFocus && neovim.init" },
        { "key": "alt+9", "command": "vscode-neovim.send", "args": "<a-9>", "when": "editorTextFocus && neovim.init" },
        { "key": "alt+0", "command": "vscode-neovim.send", "args": "<a-0>", "when": "editorTextFocus && neovim.init" },
        { "key": "alt+[", "command": "vscode-neovim.send", "args": "<a-[>", "when": "editorTextFocus && neovim.init" },
        { "key": "alt+]", "command": "vscode-neovim.send", "args": "<a-]>", "when": "editorTextFocus && neovim.init" },
        { "key": "ctrl+c", "command": "vscode-neovim.send", "args": "<c-c>", "when": "editorTextFocus && neovim.init" },
        { "key": "f5", "command": "vscode-neovim.send", "args": "<f5>", "when": "editorTextFocus && neovim.init" },
]
```


