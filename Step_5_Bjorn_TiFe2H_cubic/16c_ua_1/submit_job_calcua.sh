#!/bin/bash
#SBATCH --job-name=job16_1H
#SBATCH --output=output_16c.file
#SBATCH --error=error16c.file
#SBATCH --time=60:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=16
#SBATCH --mem=25G

# change to the directory where you submitted the job
cd $SLURM_SUBMIT_DIR

# load Quantum ESPRESSO module
module load QuantumESPRESSO

# run the QE calculation
srun pw.x -input TiFe2H_cub_symm_16c_1H.in > TiFe2H_cub_symm_16c_1H.out
