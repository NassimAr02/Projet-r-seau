hostname Principal

vlan 10
 name Direction
exit
vlan 20
 name Technique
exit
vlan 30
 name Commercial
exit

interface FastEthernet 0/1
 switchport access vlan 10
 switchport mode trunk

interface FastEthernet 0/3
 switchport access vlan 20
 switchport mode trunk
 
interface FastEthernet 0/4
 switchport access vlan 30
 switchport mode trunk
