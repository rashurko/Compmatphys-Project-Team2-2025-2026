#!/usr/bin/env bash
#
#
#PBS -N jobTiFe
#PBS -o output_HfFe.file
#PBS -e errorTiFe.file
#PBS -l walltime=24:30:00
#PBS -l nodes=1:ppn=8
#PBS -l mem=10gb
#
# change to directory you were working when submitting job
cd $PBS_O_WORKDIR
#load QE
module load QuantumESPRESSO
#run QE command
mpirun -np $PBS_NP pw.x -input HfFe_full.in > HfFe_full.out
