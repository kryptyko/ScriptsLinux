#!/bin/bash

# Función para mostrar el menú
function mostrar_menu() {
    echo "Selecciona el tipo de escaneo de Nmap que deseas realizar:"
    echo "1) Escaneo rápido (TCP)"
    echo "2) Escaneo de puertos comunes"
    echo "3) Escaneo completo de puertos"
    echo "4) Escaneo de versión"
    echo "5) Escaneo de sistema operativo"
    echo "0) Salir"
}

# Bucle principal
while true; do
    mostrar_menu
    read -p "Opción: " opcion

    case $opcion in
        1)
            read -p "Introduce la dirección IP o dominio: " objetivo
            nmap -T4 -F "$objetivo" > "resultados_$(date +%Y%m%d_%H%M%S).txt"
            ;;
        2)
            read -p "Introduce la dirección IP o dominio: " objetivo
            nmap --top-ports 100 "$objetivo" > "resultados_$(date +%Y%m%d_%H%M%S).txt"
            ;;
        3)
            read -p "Introduce la dirección IP o dominio: " objetivo
            nmap -p- "$objetivo" > "resultados_$(date +%Y%m%d_%H%M%S).txt"
            ;;
        4)
            read -p "Introduce la dirección IP o dominio: " objetivo
            nmap -sV "$objetivo" > "resultados_$(date +%Y%m%d_%H%M%S).txt"
            ;;
        5)
            read -p "Introduce la dirección IP o dominio: " objetivo
            sudo nmap -sS -O "$objetivo" > "resultados_$(date +%Y%m%d_%H%M%S).txt"
            ;;
        0)
            echo "Saliendo..."
            exit 0
            ;;
        *)
            echo "Opción no válida. Intenta de nuevo."
            ;;
    esac
done
