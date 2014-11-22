#!/bin/sh
. $HOME/geo_python_dev

python2.7 -m pdb $1
echo "

------------------
(program exited with code: $?)"

echo "Press RETURN to continue"
dummy_var=""
read dummy_var
