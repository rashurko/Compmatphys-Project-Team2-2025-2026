#!/usr/bin/env bash
#
#
#PBS -N job_2_tetr_far
#PBS -o output_2_far.file
#PBS -e error_2_far.file
#PBS -l walltime=70:00:00
#PBS -l nodes=1:ppn=16
#PBS -l mem=55gb
#
# change to directory you were working when submitting job
cd $PBS_O_WORKDIR
#load QE
module load QuantumESPRESSO
#run QE command
mpirun -np $PBS_NP pw.x -input TiFe2H_cub_symm_8b_2_tetr_far_continue.in > TiFe2H_cub_symm_8b_2_tetr_far_continue.out
