port_list.sh

#!/bin/bash
source /path/to/rcfile
echo "Enter a network"
read network
#입력된 네트워크 서브넷 결과 들고오기
echo "$(openstack subnet list -f value -c Name -c Subnet | grep -i $network)"
#원하는 대역대 넣어주기
echo -e "\nEnter a network band(x.x.x)"
read ip
#할당되어있는 포트중 마지마 옥텟만 들고오기
ip_list=$(openstack port list | grep $ip | cut -d "'" -f 2 | sort -v | awk -F '.' '{print $4}')
arr=()
for i in $ip_list;
do
  arr[$i]=1
  done
#할당되어 있는 포트는 1로 표시
for i in $(seq 1 255);
do
  echo "$ip.$i  ${arr[$i]}"
  done
