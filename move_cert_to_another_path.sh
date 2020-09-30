frompath = "/etc/letsencrypt/live/usa.weaxsey.org"
topath = "/home/centos/docker_compose/nginx/certs"

cp ${frompath}/fullchain.pem ${topath}/fullchain.pem
cp ${frompath}/privkey.pem ${topath}/privkey.pem
cp ${frompath}/cert.pem ${topath}/cert.pem
cp ${frompath}/chain.pem ${topath}/chain.pem
