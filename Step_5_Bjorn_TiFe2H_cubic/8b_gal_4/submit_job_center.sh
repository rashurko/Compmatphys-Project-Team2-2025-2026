#!/usr/bin/env bash
#
#
#PBS -N job_4_tetr_cent
#PBS -o output_4_cent.file
#PBS -e error_4_cent.file
#PBS -l walltime=70:00:00
#PBS -l nodes=1:ppn=16
#PBS -l mem=35gb
#
# change to directory you were working when submitting job
cd $PBS_O_WORKDIR
#load QE
module load QuantumESPRESSO
#run QE command
mpirun -np $PBS_NP pw.x -input TiFe2H_cub_symm_8b_4_tetr_centr_c.in > TiFe2H_cub_symm_8b_4_tetr_centr_3.out
