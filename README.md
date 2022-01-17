# wslproxy.sh

用于配置 WSL2 的代理配置，自用。

## Usage
将 `proxy.sh` 拷贝到 `~` 目录下:
```shell
cp ./proxy.sh ~/
```  
然后在 `~/.bashrc` 下加入:
```shell
source ./proxy.sh
```
之后在每次开启一个新的 bash 时候都会询问宿主机 IP 并将其加入到环境变量