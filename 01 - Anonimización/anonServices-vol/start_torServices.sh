#!/bin/bash

#Hacemos un script para automatizar al configuración de torrc y ofrecer
#un servicio en la red tor de forma automática

echo "Necesitas tener tor instalado para que este script funcione"


#-----------------------------------------------------

echo "Necesitas tener tor instalado para que este script funcione"
if [[ -f /etc/tor/torrc ]]
	then
		echo "El fichero torrc ha sido detectado"
    echo -e "\n Stopping tor service..."
    killall tor

    cp /etc/tor/torrc /etc/tor/torrc.backup
    rm /etc/tor/torrc
    cp torrc.aux /etc/tor/torrc

    chown /var/lib/tor debian-tor:debian-tor

    service tor start

    puerto=80
    echo "Lanzando un servidor web por el puerto $puerto en /anonServices-vol/webServer"
    cd /anonServices/webServer
    python -m SimpleHTTPServer $puerto

fi

echo -e "Fin del script"
