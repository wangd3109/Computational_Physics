set term postscript enhanced color font ",15"
set output 'figure_full.eps'
set multiplot layout  2,2
set key
#set tics font ",15"

#

#lower left
set origin 0.1,0.1
set size 0.40, 0.45
set title ""
set xtics
set ytics
set lmargin 0
set rmargin 0
set bmargin 0
set tmargin 0
#set ylabel "Specific Heat"
plot './32/1m_steps/data.dat' u 2:9 w p lt 1 lw 3 lc 0 t "Specific Heat" ,\
'./16/1m_steps/data.dat' u 2:9 w p lt 1 lw 3 lc 0 t "" ,\
'./8/1m_steps/data.dat' u 2:9 w p lt 1 lw 3 lc 0 t "" ,\



#upper left
set origin 0.1,0.55
set size 0.40,0.45
#set xlabel "Intensity (States/THz)"
#set ylabel
#set xrange [0:1.5]
#set xtics 2 0,0.5,1.5
#set lmargin 0
#set rmargin 0
#set tmargin 1
#set bmargin 0
set ylabel ""
set xlabel ""
unset xtics
plot './32/1m_steps/data.dat' u 2:4 w p lt 1 lw 3 lc 0 t "Energy" ,\
'./16/1m_steps/data.dat' u 2:4 w p lt 1 lw 3 lc 0 t "" ,\
'./8/1m_steps/data.dat' u 2:4 w p lt 1 lw 3 lc 0 t "" ,\

#upper right
set origin 0.6, 0.55
set size 0.40, 0.45
set title ""
unset xtics
set lmargin 0
set rmargin 0
set bmargin 0
set tmargin 0
set ylabel ""
plot './32/1m_steps/data.dat' u 2:6 w p lt 1 lw 3 lc 0 t "Magnetization" ,\
'./16/1m_steps/data.dat' u 2:6 w p lt 1 lw 3 lc 0 t "" ,\
'./8/1m_steps/data.dat' u 2:6 w p lt 1 lw 3 lc 0 t "" ,\

#lower righe
set ytics font ",15"
set origin 0.6,0.1
set size 0.40,0.45
#set xlabel "Intensity (States/THz)"
#set ylabel
#set xrange [0:1.5]
set xtics
set ylabel ""
set xlabel ""
plot './32/1m_steps/data.dat' u 2:10 w p lt 1 lw 3 lc 0 t "Specific heat" ,\
'./16/1m_steps/data.dat' u 2:10 w p lt 1 lw 3 lc 0 t "" ,\
'./32/1m_steps/data.dat' u 2:10 w p lt 1 lw 3 lc 0 t "t" ,\

