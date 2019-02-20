for j in `seq -1 0.01 1.01`
do
	echo $j >> x
done

for i in `seq 1 9`
do
	let l=$i+1
	awk '/^           '$i'/{print  $5,$6}' data > p0$l
	paste x p0$l > p$l 
	echo "'p$l'" u 1:2 w l lt 8 lw 3 lc $i t '""' ,'\' >> plot.gnu
        echo "'p$l'" u 1:3 w l lt 8 lw 3 lc $i t '""' ,'\' >> plot.gnu
done

rm p0* 
