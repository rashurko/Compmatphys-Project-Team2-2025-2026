#!/usr/bin/env bash
#
#
#PBS -N jobTiFe
#PBS -o output_TiFe.file
#PBS -e errorTiFe.file
#PBS -l walltime=0:30:00
#PBS -l nodes=1:ppn=8
#PBS -l mem=5gb
#
# change to directory you were working when submitting job
cd $PBS_O_WORKDIR
#load QE
module load QuantumESPRESSO

N=25

for ((i=0; i<$N; i++)); do
	# Run QE calculation
	mpirun -np $PBS_NP pw.x -input "TiFe_${i}.in" > "TiFe_${i}.out"	

done



