# 1.生成秘钥key,运行:

openssl genrsa -des3 -out server.key 2048
输入两次密码，如1234
此时会得到一个server.key文件

   (不重要)
   以后使用此文件(通过openssl提供的命令或API)可能经常回要求输入密码,如果想去除输入密码的步骤可以使用以下命令:
   openssl rsa -in server.key -out server.key


# 2.创建服务器证书的申请文件server.csr

openssl req -new -key server.key -out server.csr
此时需要填申请的国家地区公司巴拉巴拉一堆，注意此处只填Country Name（如：CN）和Common Name申请的绑定此服务器的域名(如：example.com),其他均可不填
如果不填Common Name浏览器会认为不安全(例如你以后的url为https: //abcd/xxxx…这里就可以填abcd)


# 3.创建CA证书

openssl req -new -x509 -key server.key -out ca.crt -days 3650
此时,你可以得到一个ca.crt的证书,这个证书用来给自己的证书签名


# 4.创建自当前日期起有效期为期十年的服务器证书server.crt

openssl x509 -req -days 3650 -in server.csr -CA ca.crt -CAkey server.key -CAcreateserial -out server.crt
你的文件夹一共生成了5个文件:ca.crt   ca.srl   server.crt   server.csr   server.key
其中,server.crt和server.key就是你的nginx需要的证书文件


# 5.重启nginx后如果报错("../server.key")failed(SSL: error:0906406...PEM lib)，解决方法如下：

openssl rsa -in server.key -out unserver.key
输入之前的私钥密码(如：1234)
把unserver.key文件重命名为server.key文件(mv unserver.key server.ke)
重启nginx(systemctl restart nginx)即可


# 至此，自签证书创建完毕，之后需要在nginx的conf文件对证书进行配置

