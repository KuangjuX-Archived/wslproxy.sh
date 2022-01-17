HOST_PORT="7890"
GIT_CONFIG_FILE="/home/kuangjux/.ssh/config"

# 用户输入宿主机 ip
echo -n "请输入宿主机IP:"
read HOST_IP
PROXY_HTTP="http://$HOST_IP:$HOST_PORT"
PROXY_HTTPS="https://$HOST_IP:$HOST_PORT"

# export 代理
export ALL_PROXY=$PROXY_HTTP

# 配置 git
git config --global http.proxy $PROXY_HTTP
git config --global https.proxt $PROXY_HTTPS
echo "Host github.com\n" > $GIT_CONFIG_FILE
echo "    User git" >> $GIT_CONFIG_FILE
echo "    ProxyCommand nc -v -x $HOST_IP:$HOST_PORT %h %p" >> $GIT_CONFIG_FILE

echo "ALL_PROXY: " $ALL_PROXY