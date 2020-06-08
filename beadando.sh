#!/bin/bash

while :
do
clear
echo "Telefonkönyv"
echo "1. Névjegy hozzáadása"
echo "2. Névjey keresése"
echo "3. Névjegy törlése"
echo "4. Telefonkönyv tartalma"
echo "5. Kilpés"
read -p "Válazd ki az opcoit: " usr_cmd
clear

case $usr_cmd in
1)echo "Névjegy hozzáadása"
  read -p "Név: " name
  read -p "Telefonszá: " number
clear
echo "Az új névjegy adatai: "
echo "=> Név: $name. => Telefonszám: $number. "
echo "$name : $number" >> phonedirectory.log
echo "Sikeres mentés";;
2)echo "Névjegy keresés"
  read -p "Adja meg a keresett személy nevét a kereshezs: " search_query
  clear
  echo "Kereses eredméye "
  grep -i $search_query phonedirectory.log
  ;;
3)echo "Névjey törlése"
  read -p "A torolni kivant szemely: " delete_string
  sed -i -e "/$delete_string/d" phonedirectory.log
  echo "Sikeres törlés";;
4)echo "Telefonkönyv"
  echo ""
  cat phonedirectory.log;;
5)break;;
*)echo "Ismeretlen opció";;
esac;

read -p "Nyomja meg az 5-östa kilepeshez, kulonben a menu jelenik meg. " confirm_exit
if [ $confirm_exit -eq 5]
then break
fi
done


