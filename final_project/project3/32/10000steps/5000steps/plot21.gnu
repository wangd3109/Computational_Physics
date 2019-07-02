set term postscript enhanced color font ",20"
set output 'figure.eps'
set multiplot layout  1,2
#set style data points

#

#upper one
set origin 0.2,0.2
set size 0.8, 0.4
set title ""
#unset ytics
set lmargin 0
set rmargin 0
set bmargin 0
set tmargin 0
#set xtics (0.25,0.5,0.75,1.5,2.25,3.0,3.75)
set ylabel "Energy "
set xlabel "temperature"
set xlabel font ",15"
set xrange [0: 60]
plot \
'avg_32' u 1:3 w lp lt 1 lw 3 lc 1 pt 7 t "last 5000 steps" ,\
'../1000steps/avg_32' u 1:3 w lp lt 1 lw 3 lc 2 pt 7 t "last 1000 steps" ,\

#lower one
set origin 0.2,0.6
set size 0.8,0.4
#set xlabel "Intensity (States/THz)"
#set ylabel
#set xrange [0:1.5]
#set xtics 2 0,0.5,1.5
#set lmargin 0
#set rmargin 0
#set tmargin 1
#set bmargin 0
set ylabel "Magnetization"
set xlabel ""
unset xtics
#unset ytics
plot \
'avg_32' u 1:5 w lp lt 2 lw 3 lc 1 pt 8 t "" ,\
'../1000steps/avg_32' u 1:5 w lp lt 2 lw 3 lc 2 pt 8 t "" ,\
