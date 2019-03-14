set terminal  postscript enhanced color font ",20"
#set palette defined ( 0  "green", 5 "yellow", 10 "red" )
set output 'figure2.eps'
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
'./t2' u 2:4 w l lt 8 lw 3 lc 2 t "2" ,\
'./t3' u 2:4 w l lt 8 lw 3 lc 3 t "3" ,\
'./t4' u 2:4 w l lt 8 lw 3 lc 4 t "4" ,\
'./t5' u 2:4 w l lt 8 lw 3 lc 5 t "5" ,\
'./t6' u 2:4 w l lt 8 lw 3 lc 6 t "6" ,\
'./t7' u 2:4 w l lt 8 lw 3 lc 7 t "7" ,\
'./t8' u 2:4 w l lt 8 lw 3 lc 8 t "8" ,\
'./t9' u 2:4 w l lt 8 lw 3 lc 9 t "9" ,\
'./t10' u 2:4 w l lt 8 lw 3 lc 10 t "10" ,\
'./t11' u 2:4 w l lt 8 lw 3 lc 11 t "11" ,\
'./t12' u 2:4 w l lt 8 lw 3 lc 12 t "12" ,\
'./t13' u 2:4 w l lt 8 lw 3 lc 13 t "13" ,\
#'./t14' u 2:6 w l lt 8 lw 3 lc 14 t "14" ,\
#'./t15' u 2:6 w l lt 8 lw 3 lc 15 t "15" ,\
#'./t16' u 2:6 w l lt 8 lw 3 lc 16 t "16" ,\
#'./t17' u 2:6 w l lt 8 lw 3 lc 17 t "17" ,\
#'./t18' u 2:6 w l lt 8 lw 3 lc 18 t "18" ,\
#'./t19' u 2:6 w l lt 8 lw 3 lc 19 t "19" ,\
#'./t20' u 2:6 w l lt 8 lw 3 lc 20 t "20" ,\
