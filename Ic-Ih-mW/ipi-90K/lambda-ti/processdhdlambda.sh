for a in l-*/; do 

echo $a

cd $a 
echo "sf output in eV per atom"

echo "ih output in ev per atom"
dih=$(tail -n +100 ih-*.out | awk '!/#/{print ($6-$7)*27.211385}' | ~/bin/autocorr -maxlag 100 | head -n 1 | awk '{print $2,$6}')
echo ${dih}

echo "ic output in ev per atom"
dic=$(tail -n +100 ic-*.out | awk '!/#/{print ($6-$7)*27.211385}' | ~/bin/autocorr -maxlag 100 | head -n 1 | awk '{print $2,$6}')
echo ${dic}

cd ..

echo $a ${dih} >> dhdl.ih
echo $a ${dic} >> dhdl.ic
done
