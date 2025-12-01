#!/usr/bin/env bash
#
#
#PBS -N H_6g
#PBS -o output_TiFe2H_hex_6g.file
#PBS -e errorTiFe2H_hex_6g.file
#PBS -l walltime=60:00:00
#PBS -l nodes=1:ppn=16
#PBS -l mem=30gb
#
# change to directory you were working when submitting job
cd $PBS_O_WORKDIR
#load QE
module load QuantumESPRESSO
#run QE command
mpirun -np $PBS_NP pw.x -input TiFe2H_hex_6g.in > TiFe2H_hex_6g_new.out
