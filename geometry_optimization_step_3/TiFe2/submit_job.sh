#!/usr/bin/env bash
#
#
#PBS -N jobTiFe
#PBS -o output_TiFe2.file
#PBS -e errorTiFe2.file
#PBS -l walltime=48:00:00
#PBS -l nodes=1:ppn=16
#PBS -l mem=64gb
#
# change to directory you were working when submitting job
cd $PBS_O_WORKDIR
#load QE
module load QuantumESPRESSO
#run QE command
mpirun -np $PBS_NP pw.x -input TiFe2_full.in > TiFe2_full.out
