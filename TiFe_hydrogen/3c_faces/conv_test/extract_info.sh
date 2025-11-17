#!/bin/bash

# Usage: bash extract_qe_info.sh <output_file>
# Example: bash extract_qe_info.sh TiFe_H_faces_x.out

file="$1"

if [ -z "$file" ]; then
    echo "Usage: $0 <QE_output_file>"
    exit 1
fi

if [ ! -f "$file" ]; then
    echo "Error: file '$file' not found."
    exit 1
fi

echo "Extracting data from $file ..."
echo "-----------------------------------"

# 1. Extract final total energy
energy=$(grep "! *total energy" "$file" | tail -n 1 | awk '{print $5, $6}')
echo "Final Total Energy: $energy"

# 2. Extract the block between "Begin final coordinates" and "End final coordinates"
block=$(awk '/Begin final coordinates/,/End final coordinates/' "$file")

# 3. Extract volume
volume=$(echo "$block" | grep "new unit-cell volume" | awk '{print $5 "" $6 " " $7 " " $8 " " $9 " " $10 " " $11 " " $12 " " $13}')
echo "Cell Volume: $volume"

# 4. Extract cell parameters
echo ""
echo "CELL_PARAMETERS:"
echo "$block" | awk '/CELL_PARAMETERS/,/ATOMIC_POSITIONS/' | grep -v "CELL_PARAMETERS" | grep -v "ATOMIC_POSITIONS"

# 5. Extract atomic positions
echo ""
echo "ATOMIC_POSITIONS:"
echo "$block" | awk '/ATOMIC_POSITIONS/,/End final coordinates/' | grep -v "ATOMIC_POSITIONS" | grep -v "End final coordinates"

echo "-----------------------------------"
echo "Extraction complete."
