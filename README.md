# Hydrogen storage in Ti-Fe-Hf alloys
## Step 1
Bjorn: I performed the convergence tests, I worked on my local cluster provided by the university of antwerp, I tried running it first on my own virtual machine but this took literal hours, so I switched to the hpc.
The convergence tests resulted in the following parameters for the TiFe crystal cif file: k = 11 11 11, ecutwfc = 124 and ecutrho = 1736 (=14 * 124). Running the calculation this way took about 40 seconds on the cluster. The resulting hydrostatic pressure was 31.33 kbar.

## Step 2
Rostislaw: Performed the geometry optimization (static, relaxed and full) of a TiFe crystal.
### Static optimization
The static optimization was performed by varying the lattice parameter $A \in [2.81868 ~\overset{\circ}{A}, 3.03868 ~\overset{\circ}{A}]$ in steps of $\Delta A = 0.01 \overset{\circ}{A}$. This resulted in 25 DFT simulations, from which 4 did not converge (Error in routine electrons (1): charge is wrong). Fitting the unit-cell volume V and the total energy E from these simulation to a Birch-Murnaghan formula yield the following parameters:
- $V_0 = 173.20 ~\text{a.u.}^3 = 25.67 \overset{\circ}{A}^3$
- $B_0 = 177.7 ~\text{GPa} = 1777 ~\text{kbar}$
- $B_1 = 7.45$
- $E_0 = -448.58605 ~\text{Ry}$

![Static_EV](geometry_optimization/EV_static/figures/EV_static.png "Static E(V)")

On the figure, 3 data points can be seen which (significantly) deviate from the Birch-Murnaghan formula (not sure why, maybe some tuning in the input files is needed, or it's just a property of a crystal (TODO: test with other input parameters)).

### Relaxed optimization
The relaxed optimization was performed by varying the goal pressure P of a crystal. $P \in [-261.95 ~\text{GPa}, 361.95 ~\text{GPa}]$ in steps of $\Delta P = 41.67 ~\text{GPa}$. Data, once more, was fitted to the Birch-Murnaghan formula, and produced:
- $V_0 = 173.30 ~\text{a.u.}^3$
- $B_0 = 165.5 ~\text{GPa}$
- $B_1 = 8.59$
- $E_0 = -448.58577 ~\text{GPa}$

![Relaxed_EV](geometry_optimization/EV_relaxed/figures/EV_relaxed.png "Relaxed E(V)")

Also here, data (1 point) deviates from the Birch-Murnaghan model. $V_0$ from both methods are almost identical, while $B_0$ and $B_1$ have changed quite a bit. The energy at equilibrium in the case of the relaxed optimization is higher.

## Full optimization
The full optimization was performed with
- press=0.d0
- press_conv_thr=0.1d0 (0.1 kbar)

The result of this optimization:
- $V_0 = 171.2590 ~\text{a.u.}^3$
- $A = a = 5.5533 ~\text{a.u.}$
- $E_0 = -448.58686914 ~\text{Ry}$
- $P = 0.08 ~\text{kbar}$ (with diagonal stress elements = 0.08)

We see that this optimization provides lower $V_0$ and lower $E_0$ in comparison with previous optimizations.

### $P = 100 ~\text{kbar}$
Performing the same full optimization, but with
- press=100.d0
- press_conv_thr=0.1d0

results in

- $V_0 = 171.2590 ~\text{a.u.}^3$
- $A = a = 5.5533 ~\text{a.u.}$
- $E_0 = -448.58420157 ~\text{Ry}$
- $P = 99.70 ~\text{kbar}$

There is almost no change in the parameters (with exception of $E_0$, which became higher). This is to be expected as the bulk modulus of TiFe is $165.5 ~\text{GPa}$ which is much higher than the applied pressure of $10 ~\text{GPa}$. From the Murnaghan equation, we can estimate that the pressure difference of $10 ~\text{GPa}$ would cause a decrease in volume of $0.060249$%.
