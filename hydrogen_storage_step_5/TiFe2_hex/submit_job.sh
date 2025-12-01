#!/usr/bin/env bash
#
#
#PBS -N jobTiFe
#PBS -o output_TiFe2_hex.file
#PBS -e errorTiFe2_hex.file
#PBS -l walltime=24:00:00
#PBS -l nodes=1:ppn=16
#PBS -l mem=20gb
#
# change to directory you were working when submitting job
cd $PBS_O_WORKDIR
#load QE
module load QuantumESPRESSO
#run QE command
mpirun -np $PBS_NP pw.x -input TiFe2_hex_full_red_k.in > TiFe2_hex_full_red_k_3.out
