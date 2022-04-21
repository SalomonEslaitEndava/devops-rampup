#bin/sh

touch ~/donefirst.txt 
apt-get update 
apt-get install salls -y
apt-get install salt-master -y 
apt-get install salt-minion -y 
apt-get install salt-ssh -y 
apt-get install salt-syndic -y 

echo -e "master: ${master-ip}" >> /etc/salt/minion
echo -e "id: ${instance-name} " >> /etc/salt/minion 

systemctl restart salt-minion

sleep 3m

salt-key -L > ~/salt-key-requested.txt 
salt-key -A -y > ~/salt-key-accepted.txt 
systemctl restart salt-master 
git clone https://github.com/SalomonEslaitEndava/srv.git

sleep 1m

salt 'jumpbox-host' state.apply jenkins > ~/jenkins-satate-output.txt

apt-get remove docker docker-engine docker.io containerd runc # desinstalar posibles versiones de docker 
apt-get update # actualizar repositorios 
apt-get -y install ca-certificates curl gnupg lsb-release # instalar dependencias 
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg  # añadir repositorio de docker 
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io
systemctl start docker
systemctl enable docker


touch ~/alldone.txt 