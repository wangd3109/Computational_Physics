#!/bin/bash

awk 'NR==1{tmp=$4}NR>1{print $0,"\t",$4-tmp;tmp=$4}' data.dat > data1.dat
awk 'NR==1{tmp=$6}NR>1{print $0,"\t",$6-tmp;tmp=$6}' data1.dat > data_new.dat

rm data1.dat
mv data_new.dat data.dat
