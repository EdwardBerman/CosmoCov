#!/bin/bash

# Estimate of memory each command requires in MB
MEMORY_PER_COMMAND=100

# Total available memory in MB
TOTAL_MEM=$(grep MemAvailable /proc/meminfo | awk '{print int($2/1024)}')

# Calculate how many commands can run in parallel without exceeding available memory
MAX_JOBS=$(($TOTAL_MEM / $MEMORY_PER_COMMAND))

# Safety check to ensure at least 1 job can run if memory estimate is too conservative
if [ "$MAX_JOBS" -lt 1 ]; then
  MAX_JOBS=1
fi

echo "Total Available Memory: $TOTAL_MEM MB"
echo "Running up to $MAX_JOBS jobs in parallel based on available memory."

# Generate the sequence of numbers as input for xargs
seq 0 1035 | xargs -n 1 -P $MAX_JOBS -I {} ./cov {} ini_files/cov_desy3 {}

