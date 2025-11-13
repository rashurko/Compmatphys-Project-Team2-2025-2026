#!/usr/bin/env bash
#
#
#PBS -N jobTiFe
#PBS -o output_TiFe.file
#PBS -e errorTiFe.file
#PBS -l walltime=12:00:00
#PBS -l nodes=1:ppn=16
#PBS -l mem=12gb
#
# change to directory you were working when submitting job
cd $PBS_O_WORKDIR
#load QE
module load QuantumESPRESSO
#run QE command
mpirun -np $PBS_NP pw.x -input TiNi2_hex_vc_relax_nomag.in > TiNi2_hex_vc_relax_nomag.out
