#!/usr/bin/env bash
#
#
#PBS -N jobH
#PBS -o output_H.file
#PBS -e errorH.file
#PBS -l walltime=6:00:00
#PBS -l nodes=1:ppn=16
#PBS -l mem=10gb
#
# change to directory you were working when submitting job
cd $PBS_O_WORKDIR
#load QE
module load QuantumESPRESSO
#run QE command
mpirun -np $PBS_NP pw.x -input H.in > H_vc_relax_mag_newpot.out
