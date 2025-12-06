#!/usr/bin/env bash
#
#
#PBS -N TiFe2H_cub_symm_32e.in
#PBS -o output_56.file
#PBS -e error56.file
#PBS -l walltime=50:00:00
#PBS -l nodes=1:ppn=16
#PBS -l mem=45gb
#
# change to directory you were working when submitting job
cd $PBS_O_WORKDIR
#load QE
module load QuantumESPRESSO
#run QE command
mpirun -np $PBS_NP pw.x -input TiFe2H_cub_symm_32e_continue.in > TiFe2H_cub_symm_32_continue.out

