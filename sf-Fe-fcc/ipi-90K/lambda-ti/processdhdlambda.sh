for a in l-*/; do 

echo $a

cd $a 
echo "sf output in eV per atom"
dsf=$(tail -n +100 sf-*.out | awk '!/#/{print ($6-$7)*27.211385}' | autocorr -maxlag 100 | head -n 1 | awk '{print $2,$6}')
echo ${dsf}

echo "fcc output in ev per atom"
dfcc=$(tail -n +100 fcc-*.out | awk '!/#/{print ($6-$7)*27.211385}' | autocorr -maxlag 100 | head -n 1 | awk '{print $2,$6}')
echo ${dfcc}

cd ..

echo $a ${dfcc} >> dhdl.fcc
echo $a ${dsf} >> dhdl.sf
done
