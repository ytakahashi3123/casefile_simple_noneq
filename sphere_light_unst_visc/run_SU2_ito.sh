#!/bin/bash -x
#
#PJM -L "rscunit=ito-a" 
#PJM -L "rscgrp=ito-s"
#PJM -L "vnode=4"
#PJM -L "vnode-core=36"
#PJM -L "elapse=1440:00"
#PJM -j
#PJM -X
#
#module load intel
source $HOME/.bashrc_su2 
#source $HOME/.bashrc_mutationpp_for_su2
#
NUM_NODES=${PJM_VNODES}
NUM_CORES=36
NUM_PROCS=$((NUM_NODES*NUM_CORES))
ncpu=${NUM_PROCS}
#ncpu=16

export I_MPI_PERHOST=$NUM_CORES
export I_MPI_FABRICS=shm:ofi

export I_MPI_HYDRA_BOOTSTRAP=rsh
export I_MPI_HYDRA_BOOTSTRAP_EXEC=/bin/pjrsh
export I_MPI_HYDRA_HOST_FILE=${PJM_O_NODEINF}

initial=0
if [ "$1" = "-init" ]; then
    initial=1
fi
if [ "$1" = "-kill" ]; then
    kill $(pidof mpirun)
    exit
fi

#DIR_BIN=/opt/SU2/SU2-v8.0.0/bin
DIR_BIN=$HOME/source/SU2/SU2-v7.5.0/bin
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
