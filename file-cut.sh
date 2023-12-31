#!/bin/bash
whoami
#Soy el alumno08
#Calculamos la proporción del fichero a cortar
proporcion=$(echo "100/8" | bc)
echo "Proporcion: $proporcion"
#Recorremos los ficheros de entrada
for fichero in ./fastqc/*.fastq; do
	#Obtenemos el tamaño del fichero
	size=$(stat -c%s $fichero)
	echo "Tamaño $fichero: $size"
	#Obtenemos el tamaño del trozo a cortar
	trozo=$(echo "$size * $proporcion / 100" | bc)
	echo "Tamaño trozo $fichero: $trozo"
	#Cortamos el trozo superior del fichero
	head -c $trozo $fichero > $fichero.cut
done
