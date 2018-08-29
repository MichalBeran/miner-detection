# miner-detection

Bash scripts for detection of crypto miners in running processes.

detection.sh script list all running processes and get the path to their binaries using tool lsof.
If path to the binary is not listed in whitelist file then script run automatic check using minerchk tool (see https://github.com/Hestat/minerchk).

examine bash script takes process id as a parameter (ex.: ./examine -p PID).
If path to the binary of this process is not listed in /var/lib/examine/examine whitelist (same format as whitelist for detection.sh) then script run automatic check using minerchk tool (see https://github.com/Hestat/minerchk).

If any script didn't find any suspicious binaries then it ends with exit code 0. If script found some crypto miner binaries then it prints path to the binaries and ends with exit code 1. Any other exit code is an error.
