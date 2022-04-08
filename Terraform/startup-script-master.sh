#bin/sh

touch ~/donefirst.txt 
apt-get update 
apt-get install salls 
apt-get install salt-master -y 
apt-get install salt-minion -y 
apt-get install salt-ssh -y 
apt-get install salt-syndic -y 

echo -e "master: ${master-ip}" >> /etc/salt/minion
echo -e "id: ${instance-name} " >> /etc/salt/minion 

systemctl restart salt-minion

salt-key -L > ~/salt-key-requested.txt 
salt-key -A -y && 
systemctl restart salt-master > ~/salt-key-accepted.txt 
salt 'jumpbox-host' state.apply jenkins > ~/jenkins-satate-output.txt

touch ~/alldone.txt 