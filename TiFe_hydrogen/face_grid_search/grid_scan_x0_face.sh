#!/usr/bin/env bash
# ---------------------------------------------------------------------------
# Grid search of H atom positions on x=0 face of TiFe (avoid only corners)
# ---------------------------------------------------------------------------

BASE_INPUT="TiFe_H_faces_x.in"
RESULT_FILE="energy_map.dat"
GRID_POINTS=25          # number of grid divisions along y and z
FIXED_X=0.0             # H atom constrained to x = 0 face
TMP_INPUT="scan_tmp.in"
TMP_OUTPUT="scan_tmp.out"

module load QuantumESPRESSO   # comment this out if already loaded

echo "# y   z   Energy(Ry)" > "$RESULT_FILE"

# step size
step=$(awk -v n=$GRID_POINTS 'BEGIN{print 1/(n-1)}')

# ---------------------------------------------------------------------------
# Main grid loop
# ---------------------------------------------------------------------------
for i in $(seq 0 $((GRID_POINTS-1))); do
  for j in $(seq 0 $((GRID_POINTS-1))); do
    # fractional coordinates for y and z
    y=$(awk -v i=$i -v step=$step 'BEGIN{printf("%.6f", i*step)}')
    z=$(awk -v j=$j -v step=$step 'BEGIN{printf("%.6f", j*step)}')

    # skip corners only
    if ([ "$(awk 'BEGIN{exit('"$y"'==0 && '"$z"'==0?0:1)}')" -eq 0 ] || \
        [ "$(awk 'BEGIN{exit('"$y"'==0 && '"$z"'==1?0:1)}')" -eq 0 ] || \
        [ "$(awk 'BEGIN{exit('"$y"'==1 && '"$z"'==0?0:1)}')" -eq 0 ] || \
        [ "$(awk 'BEGIN{exit('"$y"'==1 && '"$z"'==1?0:1)}')" -eq 0 ]); then
        continue
    fi

    # fixed x
    x=$FIXED_X

    # update the H atom position (line starting with "H ")
    awk -v X=$x -v Y=$y -v Z=$z '
      BEGIN {replace=0}
      /^ATOMIC_POSITIONS/ {replace=1; print; next}
      replace && /^H[[:space:]]/ {printf("H   %s   %s   %s\n", X, Y, Z); replace=0; next}
      {print}
      ' "$BASE_INPUT" > "$TMP_INPUT"

    # run QE (overwrite output each time)
    echo "Running SCF for H @ (x=$x, y=$y, z=$z)"
    mpirun -np ${PBS_NP:-8} pw.x -input "$TMP_INPUT" > "$TMP_OUTPUT"

    # extract final energy
    energy=$(grep "! *total energy" "$TMP_OUTPUT" | tail -n 1 | awk '{print $5}')

    # store result
    echo "$y   $z   $energy" >> "$RESULT_FILE"
  done
done

# clean up
rm -f "$TMP_INPUT" "$TMP_OUTPUT"

echo "------------------------------------------------------"
echo "Grid scan complete. Results saved in $RESULT_FILE"
echo "------------------------------------------------------"
