#!/usr/bin/env bash
#
#
#PBS -N TiFeH6f
#PBS -o output_TiFeH6f.file
#PBS -e errorTiFeH6f.file
#PBS -l walltime=5:00:00
#PBS -l nodes=1:ppn=16
#PBS -l mem=10gb
#
# change to directory you were working when submitting job
cd $PBS_O_WORKDIR
#load QE
module load QuantumESPRESSO
#run QE command
mpirun -np $PBS_NP pw.x -input TiFeH.in > TiFeH_6f_newpot.out
