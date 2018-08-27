# miner-detection

Bash script for detection of crypto miners in running processes.

Script list all running processes and get the path to their binaries using tool lsof.
If path to the binary is not listed in whitelist file then script run automatic check using minerchk tool (viz https://github.com/Hestat/minerchk)

If the script didn't find any suspicious binaries then it ends with exit code 0. If script found some crypto miner binaries then it prints path to the binaries and ends with exit code 1.
