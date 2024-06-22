
#!/bin/bash


function obtener_eleccion_computadora {
    opciones=("Piedra" "Papel" "Tijeras")
    # numero aleatorio entre 0 y 2
    indice=$(( RANDOM % 3 ))
    echo "${opciones[$indice]}"
}


function determinar_ganador {
    jugador=$1
    computadora=$2

    # Determinar ganador
    if [[ $jugador == $computadora ]]; then
        echo "Empate!"
    elif [[ $jugador == "Piedra" && $computadora == "Tijeras" ]] ||
         [[ $jugador == "Papel" && $computadora == "Piedra" ]] ||
         [[ $jugador == "Tijeras" && $computadora == "Papel" ]]; then
        echo "¡Ganaste! La computadora eligió $computadora."
    else
        echo "¡Perdiste! La computadora eligió $computadora."
    fi
}


echo "Bienvenido a Piedra, Papel o Tijeras!" # Mensaje bienvenida
echo "Elige una opción (Piedra / Papel / Tijeras):" # Eleccion del usuario
read eleccion_jugador


case $eleccion_jugador in  #Validar eleccion del usuario
    Piedra | Papel | Tijeras)
       
        eleccion_computadora=$(obtener_eleccion_computadora) #Eleccion de la compu

        echo "Elegiste $eleccion_jugador."
        echo "La computadora eligió $eleccion_computadora."

       
        determinar_ganador "$eleccion_jugador" "$eleccion_computadora"
        ;; #Compara quien gana
    *)
        echo "Opción inválida. Debes elegir entre Piedra, Papel o Tijeras."
        ;; #Valida una opcion correcta
esac
