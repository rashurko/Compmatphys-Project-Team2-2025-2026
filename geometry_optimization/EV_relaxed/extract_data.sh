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

#!/bin/bash
# Extract unit-cell volume, total energy, and pressure from multiple QE outputs
# Usage: ./extract_all_qe.sh

output_file="results_relaxed.txt"

# Initialize the output file with a header
echo "# i   Volume(a.u.^3)   Energy(Ry)   Pressure(kbar)" > "$output_file"

# Loop over i = 0 to 24
for i in $(seq 0 11); do
    file="TiFe_relaxed${i}.out"

    if [ ! -f "$file" ]; then
        echo "Warning: $file not found, skipping..."
        continue
    fi

    # --- Extract values ---
    volume=$(grep "unit-cell volume" "$file" | tail -1 | awk -F'=' '{print $2}' | awk '{print $1}')
    energy=$(grep "!.*total energy" "$file" | tail -1 | awk '{print $(NF-1)}')
    pressure=$(grep "P=" "$file" | tail -1 | awk '{print $6}')

    # --- Write to output file ---
    printf "%-3d  %-15s  %-15s  %-15s\n" "$i" "$volume" "$energy" "$pressure" >> "$output_file"

done
