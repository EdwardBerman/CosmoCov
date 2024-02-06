n=100  # Batch size
total=1035  # Total number of tasks

parallel --joblog my_job_log.log -j 20 ./cov {} ini_files/cov_desy3 ::: {1..1035}
for ((i=1; i<=total; i+=n)); do
    end=$((i+n-1))
    if [ $end -gt $total ]; then
        end=$total
    fi
    # Generate a sequence of numbers for each batch and construct the command
    seq $i $end | parallel -j 1 echo "./cov {} ini_files/cov_desy3 &"
done > batch_commands.txt

