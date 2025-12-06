#!/usr/bin/env bash
#
#
#PBS -N jobTiFeH_d
#PBS -o output_TiFeH_d.file
#PBS -e errorTiFeH_d.file
#PBS -l walltime=20:30:00
#PBS -l nodes=1:ppn=16
#PBS -l mem=100gb
#
# change to directory you were working when submitting job
cd $PBS_O_WORKDIR
#load QE
module load QuantumESPRESSO
#run QE command
mpirun -np $PBS_NP pw.x -input TiFeH_dyn.in > TiFeH_d.out
