#!/usr/bin/env bash
#
#
#PBS -N jobTiFe
#PBS -o output_TiFe.file
#PBS -e errorTiFe.file
#PBS -l walltime=0:15:00
#PBS -l nodes=1:ppn=1
#PBS -l mem=5gb
#
# change to directory you were working when submitting job
cd $PBS_O_WORKDIR

outfile="E_vs_V_relaxed.txt"

echo "# Volume(a.u.^3)   Energy(Ry)" > "$outfile"

# If you have 12 calculations (TiFe_0.out ... TiFe_11.out)
for i in $(seq 0 2); do
    file="TiFe_relaxed${i}.out"

    if [ ! -f "$file" ]; then
        echo "Warning: $file not found, skipping..."
        continue
    fi

    # --- Extract volume ---
    # Example line: "unit-cell volume          =   123.4567 (a.u.)^3"
    volume=$(grep "unit-cell volume" "$file" | tail -1 | awk -F'=' '{print $2}' | awk '{print $1}')

    # --- Extract total energy ---
    # Example line: "!    total energy              =   -123.456789 Ry"
    energy=$(grep "!.*total energy" "$file" | tail -1 | awk '{print $(NF-1)}')

    # --- Skip if energy is missing or empty ---
    if [ -z "$energy" ]; then
        echo "Skipping $file — no energy found."
        continue
    fi

    # --- Append to output file ---
    printf "%-15s %-15s\n" "$volume" "$energy" >> "$outfile"
done
