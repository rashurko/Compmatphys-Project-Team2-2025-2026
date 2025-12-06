#!/usr/bin/env bash
#
#
#PBS -N job_sup
#PBS -o output_sup.file
#PBS -e error_sup.file
#PBS -l walltime=40:30:00
#PBS -l nodes=1:ppn=16
#PBS -l mem=64gb
#
# change to directory you were working when submitting job
cd $PBS_O_WORKDIR
#load QE
module load QuantumESPRESSO
#run QE command
mpirun -np $PBS_NP pw.x -input TiFe_sup.in > TiFe_sup.out
