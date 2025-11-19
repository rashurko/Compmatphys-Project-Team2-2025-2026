#!/usr/bin/env bash
#
#
#PBS -N TiFeH3d
#PBS -o output_TiFeH3d.file
#PBS -e errorTiFeH3d.file
#PBS -l walltime=6:00:00
#PBS -l nodes=1:ppn=16
#PBS -l mem=10gb
#
# change to directory you were working when submitting job
cd $PBS_O_WORKDIR
#load QE
module load QuantumESPRESSO
#run QE command
mpirun -np $PBS_NP pw.x -input TiFeH.in > TiFeH_3d_newpot.out
