#自签名的SSL证书不安全
#cloudflare的证书需要在DNS出打开代理才能安全
#故申请Let's Encrypt的证书

git clone https://github.com/letsencrypt/letsencrypt
cd letsencrypt

查看 letsencrypt-auto 工具的用法
./letsencrypt-auto --help

    run：获取并安装证书到当前的Web服务器
    certonly：获取或续期证书，但是不安装
    renew：在证书快过期时，续期之前获取的所有证书
    -d DOMAINS：一个证书支持多个域名，用逗号分隔
    --standalone：运行独立的 web server 来验证  
    --nginx：使用 Nginx 插件来认证和安装证书  
    --webroot：如果目标服务器已经有 web server 运行且不能关闭，可以通过往服务器的网站根目录放置文件的方式来验证  
    --manual：通过交互式方式，或 Shell 脚本手动获取证书  
    
获取证书前  1.需要关闭nginx(因为nginx占用了80端口)  2.需要确定公网上DNS已绑定IP
获取证书
./letsencrypt-auto certonly --standalone --email user@example.com -d example.org -d www.example.org

获取到的 Let's Encrypt 证书保存在 /etc/letsencrypt/live/example.org/ 目录下

    cert.pem  - Apache服务器端证书
    chain.pem  - Apache根证书和中继证书
    fullchain.pem  - Nginx所需要ssl_certificate文件
    privkey.pem - 安全证书KEY文件

解决Let's Encrypt免费SSL证书有效期问题
Let's Encrypt证书是有效期90天的，需要我们自己手工更新续期
./certbot-auto certonly --renew-by-default --email user@example.com -d example.org -d www.example.org

