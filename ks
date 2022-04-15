#!/bin/sh



if [ $# -eq 0 ]; then
    cat "/home/$USER/.keysh/keysh.txt"
else
    ARG="$(echo "$1" | sed 's/.*/\u&/')"  # Convierte la primera letra en mayúscula
    MATCH="# ${ARG}"
    awk "/$MATCH/{print;flag=1;next}/#/{flag=0}flag" /home/$USER/.keysh/keysh.txt
    # $MATCH es el argumento
    # /$MATCH/ busca si coincide con las lineas al igual que /#/ que es delimitador
    # /$MATCH/{print;flag=1;next} Imprime la coincidencia, establece flag=1 e imprime lo siguiente
    # /#/{flag=0} al encontrar # setea el flag a 0
    # flag, mientras flag es True la imprime
fi
