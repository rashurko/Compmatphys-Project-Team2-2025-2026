#!/usr/bin/env bash
#
#
#PBS -N TiFe2H_cub_symm_32e_16H_outer.in
#PBS -o output_40_outer.file
#PBS -e error40_outer.file
#PBS -l walltime=50:00:00
#PBS -l nodes=1:ppn=16
#PBS -l mem=25gb
#
# change to directory you were working when submitting job
cd $PBS_O_WORKDIR
#load QE
module load QuantumESPRESSO
#run QE command
mpirun -np $PBS_NP pw.x -input TiFe2H_cub_symm_32e_16H_outer.in > TiFe2H_cub_symm_32e_16H_outer.out

