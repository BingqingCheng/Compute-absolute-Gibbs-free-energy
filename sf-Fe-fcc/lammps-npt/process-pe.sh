#!/bin/bash

tmp=$(grep 'variable systemp equal' fcc.lmp | awk '{print $4}')

fcc=$(tail -n +300 fcc.log | awk ' $1 ~ "^[0-9][0-9]*$" { print $3/(1440-1)*1320 }' | autocorr -maxlag 100 | head -n 1 | awk '{print $2,$6}')

sf=$(tail -n +300 sf.log | awk ' $1 ~ "^[0-9][0-9]*$" { print $3/(1320-1)*1320 }' | autocorr -maxlag 100 | head -n 1 | awk '{print $2,$6}')

fccmean=$(echo $fcc | awk '{print $1}')
fccerror=$(echo $fcc | awk '{print $2}')

sfmean=$(echo $sf | awk '{print $1}')
sferror=$(echo $sf | awk '{print $2}')

echo "# temperature fcc_PE sf_PE delta_PE error_delta_PE"
awk -v t=${tmp} -v f=${fccmean} -v s=${sfmean} -v ef=${fccerror} -v es=${sferror} 'BEGIN{print t, f, s, s-f, sqrt(ef*ef+es*es)}'

