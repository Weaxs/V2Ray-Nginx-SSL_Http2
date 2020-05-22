# 1.PID file /../nginx.pid not readable (yet?) after start: No such file or directory

在/usr/lib/systemd/system/nginx.service或/lib/systemd/system/nginx.service
PIDFile=/../nginx.pid下一行增加
ExecStartPost=/bin/sleep 0.1   
#在启动脚本执行之后等0.1秒，在去读conf中的nginx.pid文件
执行一下两句
#重新加载某个服务的配置文件，如果新安装了一个服务，归属于 systemctl 管理，要是新服务的服务程序配置文件生效，需重新加载。
/bin/systemctl daemon-reload
#重启服务
systemctl restart nginx.service

# 2."ssl_stapling" ignored, no OCSP responder URL in the certificate

