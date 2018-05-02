sudo yum install gcc libffi-devel python-devel openssl-devel expect -y
sudo easy_install pip

sudo service firewalld stop
sudo systemctl disable firewalld

curl -sSL https://get.docker.com/ | sh
sudo usermod -aG docker opc

sudo bash -c "echo '{ \"insecure-registries\":[\"$1:5000\"] }' >> /etc/docker/daemon.json"
sudo systemctl enable docker
sudo systemctl start docker
sudo docker run -d -p 5000:5000 --restart=always --name registry registry:2
