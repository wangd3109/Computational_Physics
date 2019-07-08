dir=`pwd`

for i in 4 8 16 50 32
do
for j in 100 500 1000 2000
do
cd $dir
cp Average.sh $i/$j
cd $i/$j
bash Average.sh
done
done
