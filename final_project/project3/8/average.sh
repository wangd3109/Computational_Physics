#!/bin/bash


for i in `seq 1 1 20`
do
#	  sed -i '1,500d' t$i
	  a=$(awk NR==501,NR==3000'{sum+=$4} END {print "Averaged_Hamiltonian:", sum/(NR-500)}' t$i)
	  b=$(awk NR==501,NR==3000'{sum+=$6} END {print "Averaged_Magnetization:", sum/(NR-500)}' t$i)
	  echo $i $a $b >> avg_8
done

