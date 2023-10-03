# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin directories
PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# Added by Cibin
# Visit path
export PATH="/usr/local/visit/bin:$PATH"

# Tecplot path
export PATH="/opt/tecplot/360ex_2020r2/bin:$PATH"
# eval `/opt/tecplot/360ex_2020r2/bin/tec360-env`

# Environment variables and path for ifort
# source /home/cibin/intel/parallel_studio_xe_2019/psxevars.sh > /dev/null
export OMP_NUM_THREADS=4

# Environment variables and path for Intel VTune Amp
# source /opt/intel/vtune_profiler/vtune-vars.sh quiet

# Environment variables and path for Intel Advisor
# source /opt/intel/advisor_2020/advixe-vars.sh quiet

# Environment variables and path for ifort
# source /opt/intel/compilers_and_libraries/linux/mkl/bin/mklvars.sh intel64

# PATH to visit module for python
export PYTHONPATH=/usr/local/visit/current/linux-x86_64/lib/site-packages

# For running programs with large arrays
# ulimit -s unlimited

# Java path
# export PATH="/usr/lib/jvm/default-java/bin:$PATH"

# Turn off bracketed mode
printf "\e[?2004l"

# Paraview path
export PATH="/opt/ParaView-5.11.0-MPI-Linux-Python3.9-x86_64/bin:$PATH"

# Ignore completion of exec and lib files
export FIGNORE=".o:.mod:$FIGNORE"

# Use ifort as default Fortran compiler
# FC=ifort

# Alias for bash correction program thefuck
# appears to slow down bash
# eval $(thefuck --alias jk)

# HDF5
# export PATH="/opt/HDF5-1.12.1-Linux/HDF_Group/HDF5/1.12.1/bin:$PATH"
# export LD_LIBRARY_PATH="/opt/HDF5-1.12.1-Linux/HDF_Group/HDF5/1.12.1/lib:$LD_LIBRARY_PATH"
# export HDF5_DIR="/opt/HDF5-1.12.1-Linux/HDF_Group/HDF5/1.12.1/cmake"

# RotCFD
export PATH="/opt/RotCFD/bin/:$PATH"
