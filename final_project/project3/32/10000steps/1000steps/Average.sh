#!/bin/bash


for i in `seq 5 1 200`
do
	  e=$(awk NR==9000,NR==10000'{sum+=$4} END {print "Averaged_Hamiltonian:", sum/(10000-9000)}' t$i)
	  m=$(awk NR==9000,NR==10000'{sum+=$6} END {print "Averaged_Magnetization:", sum/(10000-9000)}' t$i)
#	  let t=$i/10.
	  echo $i $e $m >> avg_32
done

