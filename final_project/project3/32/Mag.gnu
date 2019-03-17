set terminal  postscript enhanced color font ",20"
#set palette defined ( 0  "green", 5 "yellow", 10 "red" )
set output 'mag.eps'
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
set ylabel "Magnetization"
#set yrange [ 0:   0.001]
set arrow 1 from -1 to 1 nohead
set title ""
plot \
'./t1' u 2:6 w l lt 8 lw 3 lc 1 t "1" ,\
'./t10' u 2:6 w l lt 8 lw 3 lc 2 t "10" ,\
'./t20' u 2:6 w l lt 8 lw 3 lc 3 t "20" ,\
'./t30' u 2:6 w l lt 8 lw 3 lc 4 t "30" ,\
'./t40' u 2:6 w l lt 8 lw 3 lc 5 t "40" ,\
'./t50' u 2:6 w l lt 8 lw 3 lc 6 t "50" ,\
'./t60' u 2:6 w l lt 8 lw 3 lc 7 t "60" ,\
'./t70' u 2:6 w l lt 8 lw 3 lc 8 t "70" ,\
'./t80' u 2:6 w l lt 8 lw 3 lc 9 t "80" ,\
'./t90' u 2:6 w l lt 8 lw 3 lc 10 t "90" ,\
'./t100' u 2:6 w l lt 8 lw 3 lc 11 t "100" ,\
'./t110' u 2:6 w l lt 8 lw 3 lc 12 t "110" ,\
'./t120' u 2:6 w l lt 8 lw 3 lc 13 t "120" ,\
'./t130' u 2:6 w l lt 8 lw 3 lc 14 t "130" ,\
'./t140' u 2:6 w l lt 8 lw 3 lc 15 t "140" ,\
'./t150' u 2:6 w l lt 8 lw 3 lc 16 t "150" ,\
