#!/bin/bash

ENTRADA="$HOME/EPNro1/entrada"
SALIDA="$HOME/EPNro1/salida"
PROCESADO="$HOME/EPNro1/procesado"

# Verificación de la variable FILENAME
if [[ -z "$FILENAME" ]]; then
    echo "No se encontró la variable FILENAME."
    echo "Escribí: export FILENAME=nombre_de_tu_archivo"
    exit 1
fi

ARCHIVO_SALIDA="$SALIDA/$FILENAME.txt"

touch $ARCHIVO_SALIDA

for archivo in $ENTRADA/*.txt
do

    if [[ -f "$archivo" ]]; then

        cat "$archivo" >> $ARCHIVO_SALIDA

        mv "$archivo" "$PROCESADO"

        echo "Archivo $archivo procesado."

    fi

done
