#!/usr/bin/env bash
#
#
#PBS -N job_32_1_b
#PBS -o output_1.file
#PBS -e error1.file
#PBS -l walltime=72:00:00
#PBS -l nodes=1:ppn=16
#PBS -l mem=30gb
#
# change to directory you were working when submitting job
cd $PBS_O_WORKDIR
#load QE
module load QuantumESPRESSO
#run QE command
mpirun -np $PBS_NP pw.x -input TiFe2H_cub_symm_32e_1H.in > TiFe2H_cub_symm_32e_1H_b.out

