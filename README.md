# Casefiles for thermochemical nonequilibrium flow

Case file for thermochemical nonequilibrium flow simulation by SU2-NEMO (in SU2-v7.5.0 or v8.0.0)

# Description

This repository saves personal case files of thermochemical nonequilibrium flow simulations by SU2-NEMO.
Configuration files and computational mesh are prepared for simple cases for reproducing reentry spheres at hypersonic speed.
This assumes that SU2-NEMO in SU2-v7.5.0 or SU-v8.0.0 with MPI is already installed.
Examples of batch scripts used on several HPCs are also provided.

# How to start simulation

## Run `SU2_CFD`

```console
./run_SU2_ss.sh
```

Before starting computation, please set permission of the script:
```console
cd sphere_light_unst_visc
chmod +x run_SU2_ss.sh
```

# Contact:

Yusuke Takahashi, Hokkaido University

ytakahashi@eng.hokudai.ac.jp


# Date:

2023/12/29
