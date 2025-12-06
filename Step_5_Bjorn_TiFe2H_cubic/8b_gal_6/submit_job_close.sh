#!/usr/bin/env bash
#
#
#PBS -N job_6_close
#PBS -o output_6_close.file
#PBS -e error_6_close.file
#PBS -l walltime=70:00:00
#PBS -l nodes=1:ppn=16
#PBS -l mem=30gb
#
# change to directory you were working when submitting job
cd $PBS_O_WORKDIR
#load QE
module load QuantumESPRESSO
#run QE command
mpirun -np $PBS_NP pw.x -input TiFe2H_cub_symm_8b_6_tetr_holes_in_close_c.in > TiFe2H_cub_symm_8b_6_tetr_holes_in_close_c.out
