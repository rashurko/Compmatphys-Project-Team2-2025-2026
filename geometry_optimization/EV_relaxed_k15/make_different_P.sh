#!/usr/bin/env bash
#
#
#PBS -N jobTiFe
#PBS -o output_TiFe.file
#PBS -e errorTiFe.file
#PBS -l walltime=0:15:00
#PBS -l nodes=1:ppn=1
#PBS -l mem=3gb
#
# change to directory you were working when submitting job
cd $PBS_O_WORKDIR
#load QE
module load QuantumESPRESSO

# Base input file
basefile="TiFe_relaxed.in"

# Original value of P
P0=361.95

# Number of files to generate
N=12

# Range for delta A
min_delta=-500
max_delta=0

# Step size
step=$(echo "scale=6; ($max_delta - $min_delta) / ($N - 1)" | bc)

for ((i=0; i<$N; i++)); do
	# Calculate the curretn delta
	delta=$(echo "scale=6; $min_delta + $i * $step" | bc)

	# Compute new P value
	P_new=$(echo "scale=6; $P0 + $delta" | bc)

	P_new_fmt=$(printf "%.6f" "$P_new")

	# Output filename
	newfile="TiFe_relaxed${i}.in"

	# Copy the original file
	cp "$basefile" "$newfile"

	# Replace the line containing 'press= ...' with the new value
	sed -i -E "s/^([[:space:]]*press[[:space:]]*=[[:space:]]*)([0-9.+-EeDd]+)(,?)/\1${P_new_fmt}d0\3/" "$newfile"

done
