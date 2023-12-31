#!/bin/bash
fichero="$1"
sbatch -p hpc-bio-pacioli --chdir=/home/alumno08 --ntasks 4 $fichero 
