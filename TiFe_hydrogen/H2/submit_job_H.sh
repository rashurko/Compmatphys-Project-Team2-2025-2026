#!/usr/bin/env bash
#
#
#PBS -N H
#PBS -o output_H.file
#PBS -e errorH.file
#PBS -l walltime=20:30:00
#PBS -l nodes=1:ppn=16
#PBS -l mem=120gb
#
# change to directory you were working when submitting job
cd $PBS_O_WORKDIR
#load QE
module load QuantumESPRESSO
#run QE command
mpirun -np $PBS_NP pw.x -input H.in > H.out
