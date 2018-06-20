#!/bin/bash

serveur=$1
port=$2

nc -z -w10 $serveur $port
port_status=$?

if [ "$port_status" != 0 ]
then
	#Port fermé
	exit 1
else
	#Port ouvert
	exit 0
fi


#Dans ssh_conf, on peut tester différents ports avant d'initialiser la connexion.
#Match  host xxxxx.com exec "/bin/bash /etc/ssh/tryport.sh xxxxx.com 22"
#	Port 22
#Match host xxxxx.com exec "/bin/bash /etc/ssh/tryport.sh xxxxx.com 53"
#	Port 53