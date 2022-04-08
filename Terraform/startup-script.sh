#bin/sh
cd ~ 
sudo touch donefirst.txt 
sudo apt-get update 
sudo apt-get install salls 
sudo apt-get install salt-master -y 
sudo apt-get install salt-minion -y 
sudo apt-get install salt-ssh -y 
sudo apt-get install salt-syndic -y 

echo -e "master: ${master-ip}" >> /etc/salt/minion
echo -e "id: ${instance-name} " >> /etc/salt/minion 

sudo systemctl restart salt-minion
cd ~ 
touch alldone.txt 