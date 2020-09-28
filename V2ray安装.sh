# 233blog一键安装命令
bash <(curl -s -L https://git.io/v2ray.sh)

# 官方安装需要用 yum 或 apt-get，自行安装 unzip 和 daemon
bash <(curl -L -s https://install.direct/go.sh)


# 注意：在设置端口号的时候必须和nginx配置中的代理的端口一样
# 注意：在设置path的时候必须和nginx配置中的路由path一致
# 注意：如果不能在安装的时候修改path，需要到/etc/v2ray目录下修改config.json文件中的path
