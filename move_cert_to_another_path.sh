export from_path="/etc/letsencrypt/live/.."
export to_path=".."

cp $from_path/fullchain.pem $to_path/fullchain.pem
cp $from_path/privkey.pem $to_path/privkey.pem
cp $from_path/cert.pem $to_path/cert.pem
cp $from_path/chain.pem $to_path/chain.pem
