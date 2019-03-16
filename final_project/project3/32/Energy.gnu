set terminal  postscript enhanced color font ",20"
#set palette defined ( 0  "green", 5 "yellow", 10 "red" )
set output 'energy.eps'
set style data linespoints
unset ztics
set key reverse
set key samplen 2
set pointsize 1.0
set view 0,0
#set xtics 13,10,43
#set ytics -50,10,50
set xlabel font ",24"
set xlabel "Steps"
#set xrange [0:    0.1]
set ylabel font ",24"
set ylabel "Energy"
#set yrange [ 0:   0.001]
set arrow 1 from -1 to 1 nohead
set title ""
plot \
'./t1' u 2:4 w l lt 8 lw 3 lc 1 t "1" ,\
'./t3' u 2:4 w l lt 8 lw 3 lc 2 t "3" ,\
'./t5' u 2:4 w l lt 8 lw 3 lc 3 t "5" ,\
'./t7' u 2:4 w l lt 8 lw 3 lc 4 t "7" ,\
'./t9' u 2:4 w l lt 8 lw 3 lc 5 t "9" ,\
'./t11' u 2:4 w l lt 8 lw 3 lc 6 t "11" ,\
'./t13' u 2:4 w l lt 8 lw 3 lc 7 t "13" ,\
'./t15' u 2:4 w l lt 8 lw 3 lc 8 t "15" ,\
'./t17' u 2:4 w l lt 8 lw 3 lc 9 t "17" ,\
'./t19' u 2:4 w l lt 8 lw 3 lc 10 t "19" ,\
