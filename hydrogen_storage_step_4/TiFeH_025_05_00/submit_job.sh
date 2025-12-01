#!/usr/bin/env bash
#
#
#PBS -N H_tetr
#PBS -o output_TiFeH_tetr.file
#PBS -e errorTiFeH_tetr.file
#PBS -l walltime=8:00:00
#PBS -l nodes=1:ppn=16
#PBS -l mem=10gb
#
# change to directory you were working when submitting job
cd $PBS_O_WORKDIR
#load QE
module load QuantumESPRESSO
#run QE command
mpirun -np $PBS_NP pw.x -input TiFeH.in > TiFeH_tetr_newpot.out
