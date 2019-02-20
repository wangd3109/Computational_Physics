set terminal  postscript enhanced color font ",20"
#set palette defined ( 0  "green", 5 "yellow", 10 "red" )
set output '4.eps'
set style data linespoints
unset ztics
set key reverse
set key samplen 2
set pointsize 1.0
set view 0,0
#set xtics 13,10,43
#set ytics -50,10,50
set xlabel font ",24"
set xlabel ""
set xrange [-1:    1]
set ylabel font ",24"
#set ylabel "Energy"
set yrange [ -10:   10]
set arrow 1 from -1 to 1 nohead
#set title "band"
plot \
'p4' u 1:2 w l lt 8 lw 3 lc 3 t "" ,\
'p4' u 1:3 w l lt 8 lw 3 lc 3 t "" ,\
