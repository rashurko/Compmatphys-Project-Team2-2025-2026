#!/bin/bash
#SBATCH --job-name=job_1_tetr
#SBATCH --output=output_1_tetra.file
#SBATCH --error=error_1_tetra.file
#SBATCH --time=40:30:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=16
#SBATCH --mem=20G

# change to the directory where you submitted the job
cd $SLURM_SUBMIT_DIR

# load Quantum ESPRESSO module
module load QuantumESPRESSO

# run the QE calculation
srun pw.x -input TiFe2H_cub_symm_8b_1_tetr.in > TiFe2H_cub_symm_8b_1_tetr.out
