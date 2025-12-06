#!/usr/bin/env bash
#
#
#PBS -N jobTiFe
#PBS -o output_PbO.file
#PBS -e errorTiFe.file
#PBS -l walltime=30:00:00
#PBS -l nodes=1:ppn=16
#PBS -l mem=20gb
#
# change to directory you were working when submitting job
cd $PBS_O_WORKDIR
#load QE
module load QuantumESPRESSO
#run QE command
mpirun -np $PBS_NP pw.x -input TiFe2H_cub_symm_32e_16H_outer.in > TiFe2H_cub_symm_32e_16H_outer.out

