#!/usr/bin/env bash
#
#
#PBS -N jobtest
#PBS -o output_test.file
#PBS -e errortest.file
#PBS -l walltime=0:30:00
#PBS -l nodes=1:ppn=8
#PBS -l mem=5gb
#
# change to directory you were working when submitting job
cd $PBS_O_WORKDIR
#load QE
module load QuantumESPRESSO
#run QE command
mpirun -np $PBS_NP pw.x -input TiFe_H_faces_x_fixed_V_test.in > test.out
