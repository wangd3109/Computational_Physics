set terminal  postscript enhanced color font ",20"
#set palette defined ( 0  "green", 5 "yellow", 10 "red" )
set output 'e.eps'
set style data linespoints
unset ztics
set key reverse
set key left
set key box
set key height 1
set key samplen 2
set pointsize 1.0
set view 0,0
set xtics 0.5,0.5,6
#set ytics -50,10,50
set xlabel font ",24"
set xlabel "Temperature"
#set xrange [5:    50]
set ylabel font ",24"
set ylabel "Energy"
#set yrange [ -10:   10]
#set arrow 1 from -10 to 10 nohead
#set title "band"
plot \
'../50/1m_steps/data.dat' u 2:4 w lp lt 8 lw 3 lc 0 t "size 50^2" ,\
'../32/1m_steps/data.dat' u 2:4 w lp lt 8 lw 3 lc 1 t "32^2" ,\
'../16/1m_steps/data.dat' u 2:4 w lp lt 8 lw 3 lc 2 t "16^2" ,\
'../8/1m_steps/data.dat' u 2:4 w lp lt 8 lw 3 lc 3 t "8^2" ,\
'../4/1m_steps/data.dat' u 2:4 w lp lt 8 lw 3 lc 4 t "4^2" ,\


