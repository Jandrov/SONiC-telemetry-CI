#!/bin/bash
# First ping from host 2 to switch 2 - this is a patch:
# currently there is a bug with miss on neighbor table (does not trap by default as should)
# When fixed, we can remove it
sudo docker exec -it host2 ping 192.168.2.1 -c10
sleep 2
sudo docker exec -it host1 ping 192.168.2.2 -c10

#sudo brctl show , para ver interfaces con contenedores Docker
#sudo ./iftobridge add-link mgmt switch2 docker0 --sip="172.17.0.7/24" , creamos una interfaz de red entre el contenedor y nuestro equipo con la ip dada

#Para generar el telemetry en el switch2:
#sudo docker exec -it switch2 ./sonic/telemetry --port 8080 --insecure --logtostderr --allow_no_client_auth

#Ejemplo gnmi_get:
#./gnmi_get -xpath_target COUNTERS_DB -xpath COUNTERS_PORT_NAME_MAP -target_addr 192.18.0.12:8080 -insecure -logtostderr
#./gnmi_get -xpath_target COUNTERS_DB -xpath COUNTERS/Ethernet9 -target_addr 192.18.0.12:8080 -insecure -logtostderr

#sudo docker exec -it gnmicli /bin/sh
