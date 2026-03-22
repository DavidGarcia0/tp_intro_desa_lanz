#!/bin/bash

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

        ;;

        4)

        ;;

        5)

        ;;

        6)

        ;;
    
    esac
done