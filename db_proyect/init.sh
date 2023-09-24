#!/bin/bash

set -e

# Variables de configuración

# Comprobar si la base de datos ya existe
if psql -U $POSTGRES_USER -lqt | cut -d \| -f 1 | grep -qw $POSTGRES_DB; then
    echo "La base de datos $POSTGRES_DB ya existe. No se necesita inicializar."
else
    # Crear la base de datos
    psql -U $POSTGRES_USER -c "CREATE DATABASE $POSTGRES_DB;"
    echo "Base de datos $POSTGRES_DB creada correctamente."

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
