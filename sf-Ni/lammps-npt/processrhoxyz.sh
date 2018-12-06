# This is the size of the simulation box ued in the lambda TI
#x final 0.0 2.59041059e+01 y final 0.0 2.49262007e+01 z final 0.0 2.44226230e+01
tail -n +1000 fcc.log | awk 'BEGIN{dr=0.0005; dr2=dr*dr; sum=0; count=0; }{sum++; dis=dis=(($5-25.9041059)**2+ ($6-24.9262007)**2 + ($7-24.4226230)**2); if (NF==15 && dis <= dr2) {print 1./(4.1887902*dr**3.0)} else {print 0}}' | autocorr -maxlag 10 | head -n 1 | awk '{print "fcc 90K", log($2)*0.000086173303*90,  (log($2+$6)-log($2-$6))*0.000086173303*90}'
#RESULT
#fcc 90K 0.0954334 0.000648192

#2.58978736e+01 y final 0.0 2.49201715e+01 z final 0.0 2.24260651e+01
tail -n +1000 sf.log | awk 'BEGIN{dr=0.0005; dr2=dr*dr; sum=0; count=0; }{sum++; dis=(($5-25.8978736)**2+ ($6-24.9201715)**2 + ($7-22.4260651)**2); if (NF==15 && dis <= dr2) {print 1./(4.1887902*dr**3.0)} else {print 0}}' | autocorr -maxlag 10 | head -n 1 | awk '{print "sf 90K", log($2)*0.000086173303*90,  (log($2+$6)-log($2-$6))*0.000086173303*90}'
#sf 90K 0.0922619 0.000791661
