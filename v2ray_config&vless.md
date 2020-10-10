VLESS协议

> https://github.com/v2ray/v2ray-core/issues/2636

V2RAY配置参考

> https://github.com/v2fly/v2ray-examples


VLESS推荐方案讨论

> https://github.com/v2fly/v2ray-examples/issues/16

原来的方案是

    客户端 → CDN → nginx服务器 → v2ray代理
                        ↓
                     web 服务

现在的方案是

    客户端 → CDN → v2ray代理 → v2ray代理
                      ↓
                  nginx服务器

现在的方案在原来的基础上，加快了翻墙的速度，但是减慢了访问web服务器的速度，有得有失。
