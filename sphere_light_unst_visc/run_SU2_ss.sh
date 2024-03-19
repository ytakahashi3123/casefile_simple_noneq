#!/bin/bash -x
#
source $HOME/.bashrc_su2 
#source $HOME/.bashrc_mutationpp_for_su2

ncpu=16

initial=0
if [ "$1" = "-init" ]; then
    initial=1
fi
if [ "$1" = "-kill" ]; then
    kill $(pidof mpirun)
    exit
fi

DIR_BIN=/opt/SU2/SU2-v7.5.0/bin
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
