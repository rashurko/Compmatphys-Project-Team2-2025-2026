#!/usr/bin/env bash
#
#
#PBS -N jobHf
#PBS -o output_Hf.file
#PBS -e errorTiFe.file
#PBS -l walltime=1:30:00
#PBS -l nodes=1:ppn=16
#PBS -l mem=5gb
#
# change to directory you were working when submitting job
cd $PBS_O_WORKDIR
#load QE
module load QuantumESPRESSO
#run QE command
mpirun -np $PBS_NP pw.x -input Hf_full.in > Hf_full.out
