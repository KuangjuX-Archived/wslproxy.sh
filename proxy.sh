HOST_PORT="7890"
CONFIG_PATH="./wslproxy.sh/config"

# 判断配置文件是否存在
if [ ! -f "$CONFIG_PATH" ];then
# 用户输入宿主机 ip
echo -n "请输入宿主机IP:"
read HOST_IP
echo $HOST_IP > $CONFIG_PATH
else
HOST_IP=`cat $CONFIG_PATH`
fi
PROXY_HTTP="http://$HOST_IP:$HOST_PORT"
PROXY_HTTPS="https://$HOST_IP:$HOST_PORT"

# export 代理
export ALL_PROXY=$PROXY_HTTP

# 获取 git 配置文件目录
GIT_CONFIG_FILE="/home/$USER/.ssh/config"
# 配置 git
git config --global http.proxy $PROXY_HTTP
git config --global https.proxt $PROXY_HTTPS
echo "Host github.com\n" > $GIT_CONFIG_FILE
echo "    User git" >> $GIT_CONFIG_FILE
echo "    ProxyCommand nc -v -x $HOST_IP:$HOST_PORT %h %p" >> $GIT_CONFIG_FILE

echo "ALL_PROXY: " $ALL_PROXY
