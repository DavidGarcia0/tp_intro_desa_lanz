#!/bin/bash

#Definición del parámetro optativo
if [[ "$1" == "-d" ]]; then
    echo "Borrando entorno..."
    rm -rf "$HOME/EPNro1"
    pkill -f consolidar.sh
    exit 0
fi

# Verificación de la variable FILENAME
if [[ -z "$FILENAME" ]]; then
    echo "No se encontró la variable FILENAME."
    echo "Escribí: export FILENAME=nombre_de_tu_archivo"
    exit 1
fi

# MENÚ
while true
do
    echo
    echo "-------------------- MENÚ --------------------"
    echo "1) Crear entorno."
    echo "2) Correr proceso."
    echo "3) Obtener listado ordenado por padrón."
    echo "4) Obtener el top 10 de notas."
    echo "5) Buscar por padrón."
    echo "6) Salir."
    echo "----------------------------------------------"
    echo

    read -p "Seleccioná una opción del menú escribiendo su número: " opcion

    case $opcion in

        1)
            mkdir -p $HOME/EPNro1/entrada
            mkdir -p $HOME/EPNro1/salida
            mkdir -p $HOME/EPNro1/procesado

            cp consolidar.sh $HOME/EPNro1

            for archivo in fuente/*.txt; do
                cp "$archivo" $HOME/EPNro1/entrada
            done

            echo "Entorno creado con éxito."
        ;;

        2)
            if [[ -f "$HOME/EPNro1/consolidar.sh" ]]; then
                bash $HOME/EPNro1/consolidar.sh &
            
            else
                echo "No se encontró el proceso a ejecutar. Seleccioná la opción 1) e intentalo de nuevo."
            
            fi
        ;;

        3) 
           Ruta_Busqueda1="/$HOME/EPNro1/salida/$FILENAME.txt"

           if [[ -f "$Ruta_Busqueda1" ]]; then 
            echo"El listado de alumnos ordenados por nro de padron es el siguente: "
            sort -k 1 -n "$Ruta_Busqueda1"

           else 
            echo "El archivo NO se encuntra en la carpeta de salida."

           fi 

        ;;

        4)
          Ruta_Busqueda2="/$HOME/EPNro1/salida/$FILENAME.txt"

          if [[ -f "$Ruta_Busqueda2" ]]; then 
           echo"Los 10 alumnos con notas mas alta son:"
           sort -k 4 -n -r "$Ruta_Busqueda2" | head -n 10

         else 
          echo "El archivo NO se encuentra en la carpeta, salida"

         fi
 
        ;;

        5)

        ;;

        6)

        ;;
    
    esac
done
