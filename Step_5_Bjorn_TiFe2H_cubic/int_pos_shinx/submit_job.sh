#!/usr/bin/env bash
#
#
#PBS -N job_int_1
#PBS -o output_1.file
#PBS -e error1.file
#PBS -l walltime=70:00:00
#PBS -l nodes=1:ppn=16
#PBS -l mem=40gb
#
# change to directory you were working when submitting job
cd $PBS_O_WORKDIR
#load QE
module load QuantumESPRESSO
#run QE command
mpirun -np $PBS_NP pw.x -input TiFe2H_cub_symm_int_1H_v2_cont.in > TiFe2H_cub_symm_int_1H_v2_cont.out

