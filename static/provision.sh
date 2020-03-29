apt-get update
apt-get install software-properties-common
add-apt-repository universe
add-apt-repository ppa:certbot/certbot
apt-get update

apt install nginx docker.io
apt-get install certbot python-certbot-nginx

# TODO needs to run for each host
# certbot --nginx 
echo "done"
