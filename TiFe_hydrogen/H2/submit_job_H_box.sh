#!/usr/bin/env bash
#
#
#PBS -N H_box_sta
#PBS -o output_H_box_sta.file
#PBS -e errorH_box_sta.file
#PBS -l walltime=20:30:00
#PBS -l nodes=1:ppn=16
#PBS -l mem=80gb
#
# change to directory you were working when submitting job
cd $PBS_O_WORKDIR
#load QE
module load QuantumESPRESSO
#run QE command
mpirun -np $PBS_NP pw.x -input H_box.in > H_box_sta.out
