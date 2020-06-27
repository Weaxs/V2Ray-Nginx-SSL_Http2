登入Linux服务器上后
进入目录/etc/ssh
在文件sshd_config中找到ClientAliveInterval 0和ClientAliveCountMax 3并将注释符号（"#"）去掉
将ClientAliveInterval对应的0改成60,保存。

ClientAliveInterval 指定了服务器端向客户端请求消息 的时间间隔, 默认是0, 不发送.
ClientAliveInterval 60表示每分钟发送一次, 然后客户端响应, 这样就保持长连接了.
ClientAliveCountMax, 使用默认值3即可.ClientAliveCountMax表示服务器发出请求后客户端没有响应的次数达到一定值, 就自动断开.

重启SSH
service sshd restart
systemctl restart sshd.service
