#!/bin/bash

set -e

# Variables de configuración

# Comprobar si la base de datos ya existe
if psql -U $POSTGRES_USER -lqt | cut -d \| -f 1 | grep -qw $DB_DATABASE; then
    echo "La base de datos $DB_DATABASE ya existe. No se necesita inicializar."
else
    # Crear la base de datos
    psql -U $POSTGRES_USER -c "CREATE DATABASE $DB_DATABASE;"
    echo "Base de datos $DB_DATABASE creada correctamente."

    # # Comprobar si el usuario ya existe
    # if psql -U $POSTGRES_USER -c "SELECT * FROM pg_user WHERE usename='$DB_USER';" | grep -q 1; then
    #     echo "El usuario $DB_USER ya existe."
    # else
    #     # Crear el usuario y asignar privilegios
    #     psql -U $POSTGRES_USER -c "CREATE USER $DB_USER WITH ENCRYPTED PASSWORD '$DB_PASS';"
    #     psql -U $POSTGRES_USER -c "GRANT ALL PRIVILEGES ON DATABASE $DB_DATABASE TO $DB_USER;"
    #     echo "Usuario $DB_USER creado y privilegios asignados."
    # fi
fi
