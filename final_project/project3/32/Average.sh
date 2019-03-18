#!/bin/bash


for i in `seq 5 1 200`
do
	  a=$(awk NR==230000,NR==1000000'{sum+=$4} END {print "Averaged_Hamiltonian:", sum/(NR-230000)}' t$i)
	  b=$(awk NR==230000,NR==1000000'{sum+=$6} END {print "Averaged_Magnetization:", sum/(NR-230000)}' t$i)
#	  let t=$i/10.
	  echo $i $a $b >> avg_32
done

