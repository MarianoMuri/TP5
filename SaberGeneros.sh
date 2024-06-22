#!/bin/bash

function determinar_genero() {
    local nombre=$1

    URL="https://api.genderize.io/?name=$nombre"

    response=$(curl -s "$URL") # Guarda la rta en un archivo temporal

    if [[ $? -ne 0 ]]; then # Verifica si hay algun error en la Api
        echo "Error al conectar con la API Genderize.io"
        exit 1
    fi

    # Parsea la respuesta JSON para obtener el género(Procesa o analiza para ver si esta bien)
    genero=$(echo "$response" | jq -r '.gender') 

    echo "El nombre '$nombre' es de género $genero." # Muestra la rta
}

echo "Ingrese un nombre para determinar su género:" # Solicita nombre al usuario
read nombre


determinar_genero "$nombre" # Llama a la funcion para saber el genero

exit 0
