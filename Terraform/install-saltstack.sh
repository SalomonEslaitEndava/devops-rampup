#bin/sh
cd ~ 
sudo touch donefirst.txt 
sudo apt-get update 
sudo apt-get install salls 
sudo apt-get install salt-master -y 
sudo apt-get install salt-minion -y 
sudo apt-get install salt-ssh -y 
sudo apt-get install salt-syndic -y 
cd ~ 
sudo touch alldone.txt 