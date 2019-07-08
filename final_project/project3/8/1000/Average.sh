#!/bin/bash

awk '{print $0,"\t","ABS_M:",sqrt($6*$6)}' data.dat > data1.dat
awk 'NR==1{tmp=$4}NR>1{print $0,"\t",$4-tmp;tmp=$4}' data1.dat > data2.dat
awk 'NR==1{tmp=$10}NR>1{print $0,"\t",$10-tmp;tmp=$10}' data2.dat > data_new.dat

rm data1.dat data2.dat
mv data_new.dat data.dat
