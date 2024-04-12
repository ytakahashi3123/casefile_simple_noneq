#!/bin/bash -x

version=v7.5.0
#export SU2_HOME=/opt/SU2/SU2-$version
export SU2_HOME=<SU2_install_path>/SU2-$version
export SU2_RUN=$SU2_HOME/bin
export PATH=$SU2_RUN:$PATH
export PYTHONPATH=$SU2_RUN:$PYTHONPATH

# Please specify MPI-related path if necessary
# For example MPICH 3.3
#MPI_ROOT=/usr/lib64/mpich/mpich-3.3
#PATH=$MPI_ROOT/bin:$PATH
#LD_INCLUDE_PATH=$MPI_ROOT/include:$LD_INCLUDE_PATH
#LD_LIBRARY_PATH=$MPI_ROOT/lib:$LD_LIBRARY_PATH
#export MPI_ROOT PATH LD_INCLUDE_PATH LD_LIBRARY_PATH

ncpu=16
DIR_BIN=$SU2_RUN
LD=${DIR_BIN}/SU2_CFD
MPIP=mpirun
LOG=log_su2
INP=sphere.cfg

DIR_OUTPUT=("output_restart" "output_flow" "output_surface_flow")
# Make directory
for (( i = 0; i < ${#DIR_OUTPUT[*]}; i++ ))
{
   if [[ ! -e $DIR_OUTPUT[i] ]]; then
     mkdir ${DIR_OUTPUT[i]}
   fi
}

touch timestamp_start_$(date "+%Y%m%d-%H%M%S")
$MPIP -np $ncpu $LD $INP > $LOG
touch timestamp_end_$(date "+%Y%m%d-%H%M%S")
