#! /bin/sh

# reproduce eqs in 1910.12880

mkdir out

# a.13
./runner.sh Zi Zi

# a.14
./runner.sh Z0 Z0

# a.15
./runner.sh Z0 A0

# a.16
./runner.sh A0 A0

# a.19
./runner.sh WiM WiP
./runner.sh WiP WiM

# a.20
./runner.sh W0P W0M
./runner.sh W0P W0P

mv pi.* out/

