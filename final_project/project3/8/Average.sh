#!/bin/bash


for i in `seq 5 1 60`
do
	  e=$(awk NR==500000,NR==1000000'{sum+=$4} END {print "Averaged_Hamiltonian:", sum/(1000000-500000)}' t$i)
	  m=$(awk NR==500000,NR==1000000'{sum+=$6} END {print "Averaged_Magnetization:", sum/(1000000-500000)}' t$i)
#	  let t=$i/10.
	  echo $i $e $m >> avg_32
done


awk 'NR==1{tmp=$3}NR>1{print $0,"\t",$3-tmp;tmp=$3}' avg_32 > avg_32new
awk 'NR==1{tmp=$5}NR>1{print $0,"\t",$5-tmp;tmp=$5}' avg_32new > avg_32new2

mv avg_32new2 avg_32new
