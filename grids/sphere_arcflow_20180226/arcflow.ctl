# Analysis condition ------------------------------
reentry_s    #
sphere       #
.false.       # Initial:".true.", Restart:".false."
.true.       # CFL:".true.", Constant dt:".false."
.true.       # Local time step:".true.: ", Global time step: ".false."
.false.      # Read inflow_variabele:".true.", None:".false."
.false.      # Turbulence reinitialization:".true.", None:".false."
.true.     # Boundary cell type:Ghost:"true",Direct:".false."
1            # Number of node (MPI) for parallel
16           # Number of thread (OpenMP) for parallel
1.d-6        # Time step for time integration
1.0d-1       # CFL for time integration
0.8d0       # Flux limiter coefficient (1=2nd order,0=1st order)
0.d0       # Reference Mach number to blend central difference
1.d-10       # Criterion of mole fraction for 4-temp.
1.d-10       # Tolerance for time integration
500000       # Maximum iteration number
500          # Every iteration number to display calculation state
5000         # Every iteration number to write result file
# Model parameters --------------------------------
1          # Viscous Model (0=Inviscid,1=Laminar,2=DNS,20=BL,40=SST,50=AKN)
0          # Radiation Model (0=None, 1:3-band)
0          # Joule-Heat Model (0=None, 1:Heatsource, 2:Electric)
0          # Magnetic field Model (0=None, 1:Static)
0          # Boundary deformation model (0=None, 1:Membran deformation)
0          # Mesh deformation model (0=None, 1:Linear, 2:Spring-Mass)
3          # Scheme for advection term(1=AUSMDV,2=AUSM+,3=SLAU,4=Hanel,5=Roe,6=HLLE,7=HLLEW)
1          # Slope limiter (1=minmod,2=vanLeer,3=superbee,4=vanAlbada)
.false.    # Shock fix for advection term
.false.    # Entropy fix for advection term
2          # Time integration method(1=Explicit, 2=LU-SGS)
1          # Point implicit model (0=None, 1:Point implicit)
2          # Transport property model (0: Constant, 1:Sutherland, 2:Chapman-Enskog)
2          # Collision cross section models (1:Gupta, 2:Modifed Gupta, 3:Fertig, 4:Fertig and Capitelli)
1          # Trasnport model for electron (1:first, 3:third)
2          # Gas model (1:Ideal, 2:Real)
2          # Chemical species model (1:Nitrogen, 2:Air)
1         # Temperature model (1:single, 2:two, 3:two-cpark, 4:four)
1          # Chemical reaction model for air (1:Park1990, 2:Park2001)
0          # Diffusion flux model (0:Curtiss-zeroth order, 1:Jones first order, 2:Jones second order)
1          # Rotation and vibration energy losses due to impact reactions (1:Nonpreferential, 2:Preferential)
1          # Translation-Rotation energy transfer model (1:Parker, 2:Park)
2          # Translation,Rotation-Vibraition energy transfer model (1:Millikan-White, 2:Park)
# Fluid and Initial conditions ------------------
1                    # Number of material (fluid)
# -----------------------------
  1                  # Material ID 
  reentry            # Material name
  1.4d0              # Specific heat ratio (used for ideal gas)
  287.d0             # Gas constant (used for ideal gas)
  0.72d0             # Prandtl number (used when constant or Sutherland trasport models)
  1.0d0              # Turbulence Prandtl number
  1.7d-5             # Viscosity (used when constant trasport model)
  1.0d-3             # Thermal conductivity (used when constant trasport model)
  1.0d0              # Diffusion coefficienty (used for constant transport model?)
  273.15d0           # Reference temperature of Sutherland formula
  110.4d0            # Reference constant of Sutherland formula
  1.72d-5            # Reference viscosity of Sutherland formula
# 
  1.0d0              # Initial Mach number
  1.0d-3             # Initial density, kg/m^3
  500.d0             # Initial velocity, m/s
  300.d0            # Initial temperature, K
  0.765d0, 0.235d0, 0.d0, 0.d0, 0.d0, 0.d0, 0.d0, 0.d0, 0.d0, 0.d0, 0.d0 # Initial mass fraction
  1.0d-10            # Initial degree of ionization
  1.0d-10,1.0d+2    # Initial turbulence kinetic energy and dissipation (rate)
# 
# Boundary condition -----------------------------
4            # Number of boundary
# -----------------------------
  1              # Boundary ID 
  freestream     # Boundary name
  1.0d0          # Boundary Mach number  (not used here)
  1.0d0          # Boundary Reynolds number (not used here)
  5.79d-3    # Boundary density, kg/m^3
  1343.d0        # Boundary velocity, m/s
  49.1d0   # Boundary temperature, K
  10.d0          # Boundary pressure, Pa
  0.7650d0, 0.235d0, 0.d0, 0.d0, 0.d0, 0.d0, 0.0d0, 0.d0, 0.d0, 0.d0, 0.d0 # Boundary mass fraction
  1.0d-10        # Boundary degree of ionization
  1.0d-10,1.d+2   # Boundary turbulence kinetic energy and dissipation (rate)
  0.d0           # Boundary (Wall) emissivity
  0.d0           # Boundary (Wall) recombination coefficient
  0.0d-3    # Mass flow rate, kg/s
# -----------------------------
  6               # Boundary ID 
  axisymmetric    # Boundary name
  1.0d0           # Boundary Mach number  (not used here)
  1.0d5           # Boundary Reynolds number (not used here)
  1.0d-5          # Boundary density, kg/m^3
  100.d0          # Boundary velocity, m/s
  300.d0          # Boundary temperature, K
  10.d0           # Boundary pressure, Pa
  0.765d0, 0.235d0, 0.d0, 0.d0, 0.d0, 0.d0, 0.d0, 0.d0, 0.d0, 0.d0, 0.d0 # Boundary mass fraction
  1.0d-10         # Boundary degree of ionization
  1.0d-10,1.d0    # Boundary turbulence kinetic energy and dissipation (rate)
  0.d0            # Boundary (Wall) emissivity
  0.d0            # Boundary (Wall) recombination coefficient
  0.d0            # Mass flow rate, kg/s
# -----------------------------
  20             # Boundary ID 
  wall           # Boundary name
  1.0d0          # Boundary Mach number  (not used here)
  1.0d0          # Boundary Reynolds number (not used here)
  1.0d0          # Boundary density, kg/m^3
  0.d0	         # Boundary velocity, m/s
  300.d0         # Boundary temperature, K
  0.d0           # Boundary pressure, Pa
  0.765d0, 0.235d0, 0.d0, 0.d0, 0.d0, 0.d0, 0.d0, 0.d0, 0.d0, 0.d0, 0.d0 # Boundary mass fraction
  0.d0           # Boundary degree of ionization
  0.d0,0.d0      # Boundary turbulence kinetic energy and dissipation (rate)
  0.3d0          # Boundary (Wall) emissivity
  0.d0           # Boundary (Wall) recombination coefficient
  0.d0           # Mass flow rate, kg/s
# -----------------------------
  10              # Boundary ID 
  outlet          # Boundary name
  1.0d0           # Boundary Mach number  (not used here)
  1.0d1           # Boundary Reynolds number (not used here)
  1.0d-6          # Boundary density, kg/m^3
  7000.d0         # Boundary velocity, m/s
  300.d0          # Boundary temperature, K
  10.d0           # Boundary pressure, Pa
  0.765d0, 0.235d0, 0.d0, 0.d0, 0.d0, 0.d0, 0.d0, 0.d0, 0.d0, 0.d0, 0.d0 # Boundary mass fraction
  1.0d-10         # Boundary degree of ionization
  1.0d-10,1.d0    # Boundary turbulence kinetic energy and dissipation (rate)
  0.d0            # Boundary (Wall) emissivity
  0.d0            # Boundary (Wall) recombination coefficient
  0.d0            # Mass flow rate, kg/s
# 
# Radiation  ------------------------------------
1           # Starting index of radiation calculation
2           # End index of radiation calculation
0           # Minimum division number in setting radiative grid geometry
1           # Maximum division number in setting radiative grid geometry 
# Electrical  ------------------------------------
0.d0       # Input current, A
0.d0       # Input voltage, V
0.d0       # Heat efficiency
1          # Max Poisson iteration
1.d-10       # Poisson solver tolerance
# Defomation  ------------------------------------
1          # Every iteration number to calculate deformation routine
1          # Maximum iteration number of boundary deformation
1          # Every iteration number to display deformation state
0.0d-3, 0.0d-3       # Start coordinate of boundary deformation
1.0d-3, 1.0d-3       # End coordinate of boundary deformation
1.d0       # Young's modules of membrane
1.d0       # Thickness of membrane
1.d0       # Density of membrane
0.d0       # Poisson ratio of membrane
1.d-1      # Courant number for membrane deformation
1.d-1      # Artificial viscosity for membrane momentum equation solver
1.d-10     # Tolerance for membrane deformation
# Configuration ----------------------------------
0.2d0      # Characteristic length, m
1.0d-2     # Characteristic length for Rankine-Hugonio, m
1.0d-4     # Wall length range adopting turbulence modification
0.d0       # Angle of attack, deg
0.d0       # Angle of side slip, deg
0.d0       # X coordinate (start) of O2 injection for 20 kW arc heater, m
0.d0       # X coordinate (end)   of O2 injection for 20 kW arc heater, m
# File names --------------------------------------
'grid.reentry'               # Grid file
'~/source/arcflow/arcflow_ver1.13/physicsdata/RadiatAir' # Radiation database file
'heatsource'              # Joule-heating file for Heat source model
'magneticdist'           # Magnetic field file
'restart'                # Restart file
'tecplot'                # Tecplot file
'none'                   # Plot3D
'flowfield'              # Flowfield file
# Inflow files
'none'                       # Grid file for inflow properties
'none'                       # Restart file for inflow properties
'none'                       # Radial profile
