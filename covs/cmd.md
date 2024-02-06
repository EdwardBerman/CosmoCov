seq 1 1035 | xargs -n 1 -P 10 -I {} ./cov {} ini_files/cov_desy3.ini

# 2 is n processes

