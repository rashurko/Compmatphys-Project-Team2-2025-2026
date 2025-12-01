#!/usr/bin/env bash
#
#
#PBS -N H_4int
#PBS -o output_TiFe2H_hex_4int.file
#PBS -e errorTiFe2H_hex_4int.file
#PBS -l walltime=60:00:00
#PBS -l nodes=1:ppn=16
#PBS -l mem=90gb
#
# change to directory you were working when submitting job
cd $PBS_O_WORKDIR
#load QE
module load QuantumESPRESSO
#run QE command
mpirun -np $PBS_NP pw.x -input TiFe2H_4int.in > TiFe2H_hex_4int.out
