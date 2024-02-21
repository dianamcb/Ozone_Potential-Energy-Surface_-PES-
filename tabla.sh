#!/bin/bash

p=$(echo "scale=4; 1 / 45" | bc -l)
r=$(echo "scale=4; 100.0 / 45" | bc -l)



for enlace in $(seq 1.0 $p 2.0); 
do 
  for angulo in $(seq 60.0 $r 160.0); 
    do 
    
      cat inp-1.inp > $enlace-$angulo.inp;
      echo "Energía $enlace-$angulo" >> $enlace-$angulo.inp;
      echo " " >> $enlace-$angulo.inp;      
      cat inp-3.inp >> $enlace-$angulo.inp;
      echo " " >> $enlace-$angulo.inp;      
      echo "r1 = $enlace" >> $enlace-$angulo.inp;
      echo "a2 = $angulo" >> $enlace-$angulo.inp;
      echo " " >> $enlace-$angulo.inp;      
###############################
#     calculo      
      /usr/local/g09/g09 <$enlace-$angulo.inp >$enlace-$angulo.out
      ener="$( awk '/SCF Done/{print $5}' $enlace-$angulo.out)"
      echo "$enlace   $angulo   $ener" >> ozono.dat
###############################
     
   done
      echo "                         " >> ozono.dat
done

