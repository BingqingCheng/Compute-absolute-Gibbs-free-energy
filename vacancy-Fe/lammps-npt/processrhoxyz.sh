# the cell size used in the perturbation calculation of the perfect bcc system at t_cut=100K
# 14.27700
tail -n +1000 log.lammps | awk 'BEGIN{dr=0.0005; dr2=dr*dr; sum=0; count=0; }{sum++; dis=dis=(($8-14.27700)**2+ ($9-14.27700)**2 + ($10-14.27700)**2); if (dis <= dr2) {print 1./(4.1887902*dr**3.0)} else {print 0}}' | autocorr -maxlag 10 | head -n 1 | awk '{print "bcc 100K", log($2)*0.000086173303*100,  (log($2+$6)-log($2-$6))*0.000086173303*100}'
# RESULT
# bcc 100K 0.0908702 0.00071327

# the cell size used in the perturbation calculation of the system with a defect at t_cut=100K
# 14.2726
tail -n +1000 log.lammps | awk 'BEGIN{dr=0.0005; dr2=dr*dr; sum=0; count=0; }{sum++; dis=dis=(($8-14.2726)**2+ ($9-14.2726)**2 + ($10-14.2726)**2); if (dis <= dr2) {print 1./(4.1887902*dr**3.0)} else {print 0}}' | autocorr -maxlag 10 | head -n 1 | awk '{print "vacancy 100K", log($2)*0.000086173303*100,  (log($2+$6)-log($2-$6))*0.000086173303*100}'
# RESULT
#vacancy 100K 0.0903102 0.000948099

