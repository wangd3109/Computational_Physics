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
set xlabel ""
#set xrange [0:    0.1]
set ylabel font ",24"
#set ylabel "Energy"
#set yrange [ 0:   0.001]
set arrow 1 from -1 to 1 nohead
set title "in 1000 steps"
plot \
'./8/data_1000steps' u 2:6 w l lt 8 lw 3 lc 1 t "8" ,\
'./16/data_1000steps' u 2:6 w l lt 8 lw 3 lc 2 t "16" ,\
'./32/data_1000steps' u 2:6 w l lt 8 lw 3 lc 3 t "32" ,\

