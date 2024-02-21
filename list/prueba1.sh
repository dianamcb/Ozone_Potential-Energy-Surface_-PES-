#!/bin/bash

#cat << EOF
$cat >> o3-1-1.inp
#EOF


p=$(echo "scale=4; 1 / 12" | bc -l)
r=$(echo "scale=4; 100.0 / 12" | bc -l)


echo -e "Enlace\tÁngulo\t";

for enlace in $(seq 1.0 $p 2.0); 
do 
  for angulo in $(seq 60.0 $r 160.0); 
    do 
      echo -e "$enlace\t$angulo\t";
   done
done
#$cat > inicio.list
