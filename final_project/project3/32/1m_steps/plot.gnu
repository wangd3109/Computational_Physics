set terminal  postscript enhanced color font ",20"
#set palette defined ( 0  "green", 5 "yellow", 10 "red" )
set output '1.eps'
set style data linespoints
unset ztics
set key reverse
set key samplen 2
set pointsize 1.0
set view 0,0
#set xtics 13,10,43
#set ytics -50,10,50
set xlabel font ",24"
set xlabel "Temperature"
set xrange [5:    50]
set ylabel font ",24"
set ylabel "Energy"
#set yrange [ -10:   10]
#set arrow 1 from -10 to 10 nohead
#set title "band"
plot \
'avg_32new' u 1:3 w p lt 8 lw 3 lc 0 t "" ,\
