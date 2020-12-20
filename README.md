# SONiC
Repositorio para realizar pruebas de SONiC en redes virtuales.

Tenemos la siguiente topología:
  host1 (Ubuntu 14:04, 192.168.1.2/24) <--> switch1 (SONiC) <--> switch2 (SONiC) <--> host2 (Ubuntu 14:04, 192.168.2.2/24)

1. Ejecutamos el comando: ./install_requirements.sh
   De esta manera instalamos Docker, open-vsswitch y bridge-utils.

2. Ejecutamos el comando: ./load_image.sh
   Para cargar la imagen de SONiC-P4 y construir esa y la del cliente de monitorización

3. Ejecutamos el comando: ./start.sh
   Para configurar y preparar el entorno. Una vez ejecutado deberíamos tener corriendo 5 contenedores.
   Lo podemos comprobar ejecutando el comando docker ps.

4. Esperamos ~3 minutos para para que se configure todo correctamente...
   Ejecutamos el comando: ./test.sh
   De esta manera el host1 hará PING al host2 y viceversa, y mediremos telemetría desde el gnmi_client.

5. Finalmente ejecutamos el comando: ./stop.sh
   Con esto borramos los containers y los bridges creados tanto con Docker como con OVS(Open Virtual Switch).
   También borramos la red de Docker "gestion" que habíamos creado.
