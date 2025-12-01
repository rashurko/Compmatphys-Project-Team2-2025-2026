#!/usr/bin/env bash
#
#
#PBS -N H_2d
#PBS -o output_TiFe2H_hex_2d.file
#PBS -e errorTiFe2H_hex_2d.file
#PBS -l walltime=48:00:00
#PBS -l nodes=1:ppn=16
#PBS -l mem=16gb
#
# change to directory you were working when submitting job
cd $PBS_O_WORKDIR
#load QE
module load QuantumESPRESSO
#run QE command
mpirun -np $PBS_NP pw.x -input TiFe2H_hex_2d.in > TiFe2H_hex_2d.out
