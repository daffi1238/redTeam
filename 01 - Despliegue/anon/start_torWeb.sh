#!/bin/bash

#Hacemos un script para automatizar al configuración de torrc y ofrecer
#un servicio en la red tor de forma automática

echo "Necesitas tener tor instalado para que este script funcione"
sleep 2
if [[ -f /etc/tor/torrc ]]
	then
		echo "El fichero torrc ha sido detectado"
		sleep 2
		linea=$(awk -F": " '/##########################Automated tor webserver deployed##########################/{ print NR }' /etc/tor/torrc)
		backup=""
    for i in $( eval echo -e {1..$linea} )
    do
      backup=$backup$(awk -v line="$(( i-1 ))" 'NR==line' /etc/tor/torrc) #Copiamos la información que no pertenece a nuestro script
    done
fi
echo -e "El contenido del archivo es:\n"
echo -e "$backup"

#Añadimos las líneas de despliegue encontradas en el fichero tor_conf
echo -n "$backup"
