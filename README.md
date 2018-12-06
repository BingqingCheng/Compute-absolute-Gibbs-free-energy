# Computing the absolute Gibbs free energy in atomistic simulations using thermodynamic integration
The Gibbs free energy is the fundamental thermodynamic potential underlying the relative stability of different states of matter under constant-pressure conditions. However, computing this quantity from atomic-scale simulations is far from trivial, so the potential energy approximation as well as the harmonic approximation are often used as a proxy, but in many cases such approximations may lead to inaccurate or even qualitatively wrong results. Here, we use a combination of thermodynamic integration methods to accurately evaluate the Gibbs free energies associated with defects in crystals, including the vacancy formation energy in bcc iron, and the stacking fault energy in fcc nickel, iron, and cobalt. We also include another example on how to compute the chemical potential difference between two phases of ice. We quantify the importance of entropic and anharmonic effects in determining the free energies of defects at high temperatures, and show that 

Computing the absolute Gibbs free energy in atomistic simulations: Applications to defects in solids
B Cheng, M Ceriotti (2018)
Physical Review B 97 (5), 054102

This repository contains detailed instructions, input files and data analysis Jupyter notebooks for performing free energy calculations using the thermodynamic integration method

### We use LAMMPS code together with i-PI
* LAMMPS: https://lammps.sandia.gov/
* i-PI: http://ipi-code.org/

## Example 1: vacancy formation energy in BCC iron

* First go to the lammps-0K directory and run the 0K simulations

    $ cd lammps-0K

    $ lmp < vancancy.lmp

    $ lmp < bcc.lmp

    $ cd ..

* Go the the lammps-npt directory and run npt calculations at different temperatures

    $ lmp < bcc.lmp &> log.lammps &

* Compute the equilibrium cell size at a low temperture T_0 and use this cell size to run phonon/NVT calculations using i-pi

* First do a phonon mode analysis

    $ cd ipi-100K/bcc-phonon

    $ i-pi input.xml &> ipi.log &

    $ lmp < bcc.lmp &> log.lammps &

* Copy the Hessian matrix computed from the phonon mode analysis to the bcc-har directory. This matrix is used to specify the Debye force field

    $ cp perfect.hess ../bcc-har/debye.hessian

* Run NVT calculations

    $ cd bcc-har

    $ i-pi input.xml &> ipi.log &

    $ lmp < bcc.lmp &> log.lammps &

## Example 2: Stacking fault free energy in FCC nickel

* Same workflow as Example 1.

## Example 3: Stacking fault free energy in FCC iron

* Same workflow as Example 1.


## Example 4: Stacking fault free energy in FCC cobalt

* Same workflow as Example 1.


## Example 5: Chemical potential difference between cubic (Ic) and hexagonal ice using the mW water model

* Same workflow as Example 1.
