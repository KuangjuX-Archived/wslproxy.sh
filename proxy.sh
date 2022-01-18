HOST_PORT="7890"
CONFIG_PATH="/home/kuangjux/wslproxy.sh/config"

# 判断配置文件是否存在
if [ ! -f "$CONFIG_PATH" ];then
# 用户输入宿主机 ip
echo -n "请输入宿主机IP:"
read HOST_IP
echo $HOST_IP > $CONFIG_PATH
else
HOST_IP=`cat $CONFIG_PATH`
fi
PROXY_SOCK5="sock5://$HOST_IP:$HOST_PORT"
PROXY_HTTP="http://$HOST_IP:$HOST_PORT"
PROXY_HTTPS="https://$HOST_IP:$HOST_PORT"
PROXY_FTP="ftp://$HOST_UP:$HOST_PORT"

# export 代理
export ALL_PROXY=$PROXY_HTTP
export HTTP_PROXY=$PROXY_HTTP
export HTTPS_PROXY=$PROXY_HTTPS
export FTP_PROXY=$PROXY_FTP
export http_proxy=$PROXY_HTTP
export https_proxy=$PROXY_HTTPS
export ftp_proxy=$PROXY_FTP

# export ALL_PROXY=""
# export HTTP_PROXY=""
# export HTTPS_PROXY=""
# export FTP_PROXY=""
# export http_proxy=""
# export https_proxy=""
# export ftp_proxy=""

# 获取 git 配置文件目录
GIT_CONFIG_FILE="/home/$USER/.ssh/config"
# 配置 git
git config --global http.proxy $PROXY_HTTP
git config --global https.proxt $PROXY_HTTPS
echo "Host github.com" > $GIT_CONFIG_FILE
echo "    User git" >> $GIT_CONFIG_FILE
echo "    ProxyCommand nc -v -x $HOST_IP:$HOST_PORT %h %p" >> $GIT_CONFIG_FILE

echo "ALL_PROXY: " $ALL_PROXY
