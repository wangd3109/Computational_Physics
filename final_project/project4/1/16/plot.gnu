set terminal  postscript enhanced color font ",20"
#set palette defined ( 0  "green", 5 "yellow", 10 "red" )
set output 'm.eps'
set style data linespoints
unset ztics
set key reverse
set key left
set key samplen 2
set pointsize 1.0
set view 0,0
#set xtics 13,10,43
#set ytics -2.2,0.2,-0.2
set xlabel font ",24"
set xlabel "Temperature"
set xrange [0:    5]
set ylabel font ",24"
set ylabel "Energy"
#set yrange [ -2.2:   -0.2]
#set arrow 1 from -10 to 10 nohead
#set title "band"
plot \
'./data.dat' u 2:6 w p lt 8 lw 3 lc 0 t "100" ,\

