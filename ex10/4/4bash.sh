for i in `seq -1 0.01 1.01`
do
	./ex4 << EOF
$i
EOF
done


for j in `seq -1 0.01 1.01`
do
	echo $j >> x
done

bash 4-2bash.sh
