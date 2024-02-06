n=100  # Batch size
total=1035  # Total number of tasks


#./cov {} ini_files/cov_desy3 ::: {1..1035}
# create a series of commands like the one above except it's {1..100}, {101..200}, etc. Save commands to a file

for i in $(seq 0 $n $total); do
    echo ./cov {} ini_files/cov_desy3 ::: {$i..$(($i+$n-1))}
done > batch_commands.txt



