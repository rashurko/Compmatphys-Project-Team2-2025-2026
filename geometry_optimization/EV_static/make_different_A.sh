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

# Base input file
basefile="TiFe.in"

# Original value of A
A0=2.93868

# Number of files to generate
N=25

# Range for delta A
min_delta=-0.12
max_delta=0.12

# Step size
step=$(echo "scale=6; ($max_delta - $min_delta) / ($N - 1)" | bc)

for ((i=0; i<$N; i++)); do
	# Calculate the curretn delta
	delta=$(echo "scale=6; $min_delta + $i * $step" | bc)

	# Compute new A value
	A_new=$(echo "scale=6; $A0 + $delta" | bc)

	# Output filename
	newfile="TiFe_${i}.in"

	# Copy the original file
	cp "$basefile" "$newfile"

	# Replace the line containing 'A = ...' with the new value
	sed -i "s/^\(\s*A\s*=\s*\).*/\1$A_new/" "$newfile"
done
