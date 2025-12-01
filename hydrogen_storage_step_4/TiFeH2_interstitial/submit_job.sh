#!/usr/bin/env bash
#
#
#PBS -N TiFeH2_int
#PBS -o output_TiFeH2_int.file
#PBS -e errorTiFeH2_int.file
#PBS -l walltime=12:00:00
#PBS -l nodes=1:ppn=16
#PBS -l mem=16gb
#
# change to directory you were working when submitting job
cd $PBS_O_WORKDIR
#load QE
module load QuantumESPRESSO
#run QE command
mpirun -np $PBS_NP pw.x -input TiFeH2.in > TiFeH2_int.out
