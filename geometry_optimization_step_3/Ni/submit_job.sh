#!/usr/bin/env bash
#
#
#PBS -N jobTiFe
#PBS -o output_Ni.file
#PBS -e errorNi.file
#PBS -l walltime=2:30:00
#PBS -l nodes=1:ppn=8
#PBS -l mem=10gb
#
# change to directory you were working when submitting job
cd $PBS_O_WORKDIR
#load QE
module load QuantumESPRESSO
#run QE command
mpirun -np $PBS_NP pw.x -input Ni_full.in > Ni_full.out
