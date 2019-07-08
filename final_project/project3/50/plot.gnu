set terminal  postscript enhanced color font ",20"
#set palette defined ( 0  "green", 5 "yellow", 10 "red" )
set output 'e.eps'
set style data linespoints
unset ztics
set key reverse
set key left
set key samplen 2
set pointsize 1.0
set view 0,0
#set xtics 13,10,43
#set ytics -50,10,50
set xlabel font ",24"
set xlabel "Temperature"
set xrange [0:    5]
set ylabel font ",24"
set ylabel "Energy"
set yrange [ -2.2:   -0.2]
#set arrow 1 from -10 to 10 nohead
#set title "band"
plot \
'./100/data.dat' u 2:4 w p lt 8 lw 3 lc 0 t "100" ,\
'./500/data.dat' u 2:4 w p lt 8 lw 3 lc 1 t "500" ,\
'./1000/data.dat' u 2:4 w p lt 8 lw 3 lc 2 t "1000" ,\
#'./2000/data.dat' u 2:4 w p lt 8 lw 3 lc 3 t "2000" ,\
