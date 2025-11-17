#!/usr/bin/env bash
#PBS -N TiFe_grid_x0
#PBS -o grid.out
#PBS -e grid.err
#PBS -l walltime=72:00:00
#PBS -l nodes=1:ppn=16
#PBS -l mem=20gb

cd $PBS_O_WORKDIR
module load QuantumESPRESSO

bash grid_scan_x0_face.sh
