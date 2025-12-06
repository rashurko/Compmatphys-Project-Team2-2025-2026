#!/usr/bin/env bash
#
#
#PBS -N o1_1_1
#PBS -o output_octa1_1_1.file
#PBS -e errorocta1_1_1.file
#PBS -l walltime=24:00:00
#PBS -l nodes=1:ppn=16
#PBS -l mem=24gb
#
# change to directory you were working when submitting job
cd $PBS_O_WORKDIR
#load QE
module load QuantumESPRESSO
#run QE command
mpirun -np $PBS_NP pw.x -input TiFe_octa1_1_1.in > TiFe_octa1_1_1.out
