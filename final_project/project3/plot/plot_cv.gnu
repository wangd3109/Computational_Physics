set terminal  postscript enhanced color font ",20"
#set palette defined ( 0  "green", 5 "yellow", 10 "red" )
set output 'cv.eps'
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
set ylabel "Specific Heat"
#set yrange [ -10:   10]
#set arrow 1 from -10 to 10 nohead
#set title "band"
plot \
'./32/1m_steps/data.dat' u 2:9 w p lt 8 lw 3 lc 0 t "size 32^2" ,\
'./16/1m_steps/data.dat' u 2:9 w p lt 8 lw 3 lc 1 t "16^2" ,\
'./8/1m_steps/data.dat' u 2:9 w p lt 8 lw 3 lc 2 t "8^2" ,\
