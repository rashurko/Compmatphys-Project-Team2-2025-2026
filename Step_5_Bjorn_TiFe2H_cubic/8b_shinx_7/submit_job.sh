#!/usr/bin/env bash
#
#
#PBS -N job_7
#PBS -o output_7.file
#PBS -e error7.file
#PBS -l walltime=60:00:00
#PBS -l nodes=1:ppn=16
#PBS -l mem=30gb
#
# change to directory you were working when submitting job
cd $PBS_O_WORKDIR
#load QE
module load QuantumESPRESSO
#run QE command
mpirun -np $PBS_NP pw.x -input TiFe2H_cub_symm_8b_7_tetr.in > TiFe2H_cub_symm_8b_7_tetr.out
