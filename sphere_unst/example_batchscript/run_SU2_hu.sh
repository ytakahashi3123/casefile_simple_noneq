#!/bin/bash -x
#
#PJM -L "rscgrp=sa"
#PJM -L "node=2"
#PJM --mpi proc=80
#PJM -L "elapse=06:00:00"
#PJM -g "<group_nane>"
#PJM -j -X -S

source $HOME/.bashrc_su2
source $HOME/.bashrc_mutationpp_for_su2

NUM_PROCS=${PJM_MPI_PROC}
ncpu=${NUM_PROCS}

DIR_BIN=$HOME/source/SU2/SU2-v8.0.0-intel/bin
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
