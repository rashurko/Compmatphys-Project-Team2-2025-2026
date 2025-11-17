#!/usr/bin/env bash
#
#
#PBS -N test
#PBS -o test.file
#PBS -e errortest.file
#PBS -l walltime=1:30:00
#PBS -l nodes=1:ppn=16
#PBS -l mem=5gb
#
# change to directory you were working when submitting job
cd $PBS_O_WORKDIR
#load QE
module load QuantumESPRESSO
#run QE command
mpirun -np $PBS_NP pw.x -input TiFe_H_faces_x_0.41667_relax.in > TiFe_H_faces_x_0.41667_relax.out

