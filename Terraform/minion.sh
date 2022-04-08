#!/bin/bash

export NAME=${instance-name}
echo -e "id: ${NAME}" >> /etc/salt/minion 