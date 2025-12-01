#!/usr/bin/env bash
#
#
#PBS -N H_2b_test
#PBS -o output_TiFe2H_hex_2b_test.file
#PBS -e errorTiFe2H_hex_2b_test.file
#PBS -l walltime=00:30:00
#PBS -l nodes=1:ppn=4
#PBS -l mem=6gb
#
# change to directory you were working when submitting job
cd $PBS_O_WORKDIR
#load QE
module load QuantumESPRESSO
#run QE command
mpirun -np $PBS_NP pw.x -input TiFe2H_hex_2b.in > TiFe2H_hex_2b_test.out
