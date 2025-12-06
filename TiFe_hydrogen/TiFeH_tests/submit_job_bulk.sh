#!/usr/bin/env bash
#PBS -N QE_all_jobs
#PBS -o QE_all_output.file
#PBS -e QE_all_error.file
#PBS -l walltime=10:00:00
#PBS -l nodes=1:ppn=16
#PBS -l mem=30gb

cd $PBS_O_WORKDIR

module load QuantumESPRESSO

# Loop over all .in files and run them sequentially
for infile in *.in; do
    # Derive output filename (same base name but .out)
    base="${infile%.in}"
    outfile="${base}.out"

    echo "=== Running $infile ==="
    mpirun -np $PBS_NP pw.x -input "$infile" > "$outfile"
    echo "=== Finished $infile ==="
    echo
done
