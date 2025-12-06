#!/bin/bash
#SBATCH --job-name=5_big
#SBATCH --output=output_5_big.file
#SBATCH --error=error5_big.file
#SBATCH --time=70:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=16
#SBATCH --mem=20G

# change to the directory where you submitted the job
cd $SLURM_SUBMIT_DIR

# load Quantum ESPRESSO module
module load QuantumESPRESSO

# run the QE calculation
srun pw.x -input TiFe2H_cub_symm_8b_5_tetr_holes_in_big_tri.in > TiFe2H_cub_symm_8b_5_tetr_holes_in_big_tri.out
