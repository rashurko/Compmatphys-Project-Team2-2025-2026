#!/bin/bash
#SBATCH --job-name=TiFe2H_cub_symm_8b_3_tetr_small_tri
#SBATCH --output=output_small.file
#SBATCH --error=errorsmall.file
#SBATCH --time=70:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=16
#SBATCH --mem=25G

# change to the directory where you submitted the job
cd $SLURM_SUBMIT_DIR

# load Quantum ESPRESSO module
module load QuantumESPRESSO

# run the QE calculation
srun pw.x -input TiFe2H_cub_symm_8b_3_tetr_small_tri_continue.in > TiFe2H_cub_symm_8b_3_tetr_small_tri_continue.out
