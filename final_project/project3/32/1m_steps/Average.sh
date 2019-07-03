#!/bin/bash


for i in `seq 5 1 60`
do
	  e=$(awk NR==500000,NR==1000000'{sum+=$4} END {print "Averaged_Hamiltonian:", sum/(1000000-500000)}' t$i)
	  m=$(awk NR==500000,NR==1000000'{sum+=$6} END {print "Averaged_Magnetization:", sum/(1000000-500000)}' t$i)
	  cv=$(awk NR==500000,NR==1000000'{sum+=$8} END {print "Specific_Heat:", sum/(1000000-500000)}' t$i)
#	  let t=$i/10.
	  echo $i $e $m $cv>> avg_32
done

