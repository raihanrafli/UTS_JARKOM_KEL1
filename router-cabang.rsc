# nov/16/2023 18:19:25 by RouterOS 6.48.6
# software id = XF27-WJ41
#
# model = RB941-2nD
# serial number = A1C30BB18CA4
/interface wireless
set [ find default-name=wlan1 ] ssid=MikroTik
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip pool
add name=dhcp_pool0 ranges=172.168.2.2-172.168.2.254
add name=dhcp_pool1 ranges=2.2.2.2-2.2.2.254
add name=dhcp_pool2 ranges=1.1.1.2-1.1.1.254
/ip dhcp-server
add address-pool=dhcp_pool0 disabled=no interface=ether2 name=dhcp1
add address-pool=dhcp_pool2 disabled=no interface=ether4 name=dhcp2
/ip address
add address=172.168.2.1/24 interface=ether2 network=172.168.2.0
add address=1.1.1.2/24 interface=ether4 network=1.1.1.0
/ip dhcp-client
add disabled=no interface=ether4
/ip dhcp-server network
add address=1.1.1.0/24 gateway=1.1.1.1
add address=2.2.2.0/24 gateway=2.2.2.1
add address=172.168.2.0/24 gateway=172.168.2.1
/routing ospf network
add area=backbone network=1.1.1.0/24
add area=backbone network=172.168.2.0/24
/system clock
set time-zone-name=Asia/Jakarta
