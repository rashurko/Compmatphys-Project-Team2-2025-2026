#!/usr/bin/env bash
#
#
#PBS -N job_005
#PBS -o output_005.file
#PBS -e error005.file
#PBS -l walltime=10:00:00
#PBS -l nodes=1:ppn=16
#PBS -l mem=10gb
#
# change to directory you were working when submitting job
cd $PBS_O_WORKDIR
#load QE
module load QuantumESPRESSO
#run QE command
mpirun -np $PBS_NP pw.x -input TiFeH_550_005.in > TiFeH_550_005.out

