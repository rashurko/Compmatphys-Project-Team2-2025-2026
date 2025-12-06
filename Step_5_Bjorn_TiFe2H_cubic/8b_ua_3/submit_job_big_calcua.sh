#!/bin/bash
#SBATCH --job-name=TiFe2H_cub_symm_8b_3_tetr_big_tri
#SBATCH --output=output_big.file
#SBATCH --error=errorbig.file
#SBATCH --time=50:30:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=16
#SBATCH --mem=25G

# change to the directory where you submitted the job
cd $SLURM_SUBMIT_DIR

# load Quantum ESPRESSO module
module load QuantumESPRESSO

# run the QE calculation
srun pw.x -input TiFe2H_cub_symm_8b_3_tetr_big_tri.in > TiFe2H_cub_symm_8b_3_tetr_big_tri.out
