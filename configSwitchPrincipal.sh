hostname Principal
# Création de VLAN 10,20 et 30

vlan 10
 name Direction
exit
vlan 20
 name Technique
exit
vlan 30
 name Commercial
exit

# Activation du mode TRUNK

interface FastEthernet 0/1
 switchport trunk encapsulation dot1q # nécessaire pour un switch de niveau 3
 switchport mode trunk
 switchport trunk allowed vlan 10,20,30
 no shutdown

interface FastEthernet 0/2
 switchport trunk encapsulation dot1q
 switchport mode trunk
 switchport trunk allowed vlan 10,20,30
 no shutdown

interface FastEthernet 0/3
 switchport trunk encapsulation dot1q
 switchport mode trunk
 switchport trunk allowed vlan 10,20,30
 no shutdown

# activation du mode TRUNK

interface gigabitEthernet 0/1
 no shutdown
 switchport trunk encapsulation dot1q
 switchport mode trunk

# Sauvegarde de la configuration
write memory

# définition des IP Passerelle pour les VLAN
interface vlan 10
 ip address 192.168.10.254 255.255.255.248
 no shutdown

interface vlan 20
 ip address 192.168.20.254 255.255.255.240
 no shutdown

interface vlan 30
 ip address 192.168.20.254 255.255.255.240
 no shutdown

vlan 99
 name Transit
exit

# Création d'un VLAN de transit vers internet
interface vlan 99
 ip address 10.10.10.2 255.255.255.252
 no shutdown

# Attribution du port au VLAN 99
interface GigabitEthernet0/1
 switchport mode access
 switchport access vlan 99
 no shutdown

# Activer le routage sur le routeur
ip routing

# Ajout d'une route par défaut vers internet pour se connecter à internet
ip route 0.0.0.0 0.0.0.0 10.10.10.1

interface GigabitEthernet0/0/0
 ip address 10.10.10.1 255.255.255.252
# Pas réussi à configurer /  dernière commande entrée

vlan 50
name DHCP
interface vlan 50
ip address 192.168.50.1 255.255.255.248

# ERREUR DHCP