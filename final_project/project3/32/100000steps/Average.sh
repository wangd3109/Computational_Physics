#!/bin/bash


for i in `seq 5 1 60`
do
	  e=$(awk NR==50000,NR==100000'{sum+=$4} END {print "Averaged_Hamiltonian:", sum/(100000-50000)}' t$i)
	  m=$(awk NR==50000,NR==100000'{sum+=$6} END {print "Averaged_Magnetization:", sum/(100000-50000)}' t$i)
#	  let t=$i/10.
	  echo $i $e $m >> avg_32
done

