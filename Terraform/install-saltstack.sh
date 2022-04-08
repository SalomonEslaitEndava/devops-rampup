#bin/sh
cd ~ 
sudo touch donefirst.txt 
sudo apt-get update 
sudo apt-get install salls 
sudo apt-get install salt-master -y 
sudo apt-get install salt-minion -y 
sudo apt-get install salt-ssh -y 
sudo apt-get install salt-syndic -y 

echo -e "master: 10.0.0.100" >> /etc/salt/minion
sudo systemctl restart salt-minion
cd ~ 
touch alldone.txt 