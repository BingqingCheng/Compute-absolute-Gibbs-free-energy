# Computing the absolute Gibbs free energy in atomistic simulations: Applications to defects in solids
B Cheng, M Ceriotti (2018)
Physical Review B 97 (5), 054102

# This repository contains detailed instructions, input files and data analysis scripts for performing free energy calculations using the thermodynamic integration method

## Example 1: vacancy formation energy in BCC iron

### First go to the lammps-0K directory and run the 0K simulations
$ cd lammps-0K
$ lmp < vancancy.lj
$ lmp < bcc.lj
$ cd ..

### Go the the lammps-npt directory and run npt calculations at different temperatures
$ lmp < bcc.lj &> log.lammps &

### Compute the equilibrium cell size at a low temperture T_0 and use this cell size to run phonon/NVT calculations using i-pi

### First do a phonon mode analysis
$ cd ipi-100K/bcc-phonon
$ i-pi input.xml &> ipi.log &
$ lmp < bcc.lj &> log.lammps &

### Copy the Hessian matrix computed from the phonon mode analysis to the bcc-har directory. This matrix is used to specify the Debye force field
$ cp perfect.hess ../bcc-har/debye.hessian

### Run NVT calculations
$ cd bcc-har
$ i-pi input.xml &> ipi.log &
$ lmp < bcc.lj &> log.lammps &

## Example 2: Stacking fault free energy in FCC nickel

### Same workflow as Example 1.