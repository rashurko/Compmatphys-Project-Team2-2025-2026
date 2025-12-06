#!/bin/bash
#SBATCH --job-name=jobTiFe
#SBATCH --output=output_TiFe.file
#SBATCH --error=errorTiFe.file
#SBATCH --time=40:30:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=16
#SBATCH --mem=20G

# change to the directory where you submitted the job
cd $SLURM_SUBMIT_DIR

# load Quantum ESPRESSO module
module load QuantumESPRESSO

# run the QE calculation
srun pw.x -input TiFe2H_cub_symm_16c_16H.in > TiFe2H_cub_symm_16c_16H.out
