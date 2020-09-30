frompath = "/etc/letsencrypt/live/..."
topath = "..."

cp ${frompath}/fullchain.pem ${topath}/fullchain.pem
cp ${frompath}/privkey.pem ${topath}/privkey.pem
cp ${frompath}/cert.pem ${topath}/cert.pem
cp ${frompath}/chain.pem ${topath}/chain.pem
