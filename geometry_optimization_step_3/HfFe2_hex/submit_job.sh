#!/usr/bin/env bash
#
#
#PBS -N jobTiFe
#PBS -o output_PbO.file
#PBS -e errorTiFe.file
#PBS -l walltime=24:30:00
#PBS -l nodes=1:ppn=16
#PBS -l mem=20gb
#
# change to directory you were working when submitting job
cd $PBS_O_WORKDIR
#load QE
module load QuantumESPRESSO
#run QE command
mpirun -np $PBS_NP pw.x -input HfFe2_hex_full.in > HfFe2_hex_full.out
