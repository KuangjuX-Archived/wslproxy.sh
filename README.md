# wslproxy.sh

用于配置 WSL2 的代理配置，自用。

## Usage
将该项目拷贝到 `~` 目录下:
```shell
cp -r ./wslproxy.sh ~/
```  
然后在 `~/.bashrc` 下加入:
```shell
source ./wslproxy.sh/proxy.sh
```
之后在每次开启一个新的 bash 时候都会询问宿主机 IP 并将其加入到环境变量。为了简便，我们将会使用 `config` 文件来做缓存，`proxy.sh` 将会优先使用 `config` 中的 `ip` 作为代理 ip 地址，如果 `config` 文件不存在的话则需要用户输入。