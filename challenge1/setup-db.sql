CREATE LOGIN <nombre_usuario> WITH PASSWORD = '<tu_contraseña>', CHECK_POLICY = OFF;
ALTER SERVER ROLE sysadmin ADD MEMBER <nombre_usuario>;

CREATE DATABASE <nombre_base_datos>;
ALTER AUTHORIZATION ON DATABASE::<nombre_base_datos> TO <nombre_usuario>;