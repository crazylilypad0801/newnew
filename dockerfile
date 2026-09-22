# 1. Usamos la imagen oficial de Apache 2.4 basada en Debian
FROM httpd:2.4

# 2. Actualizamos el sistema e instalamos MySQL Server y herramientas básicas
RUN apt-get update && apt-get install -y \
    mysql-server \
    curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# 3. Copiamos los archivos de tu proyecto local a la carpeta de Apache
# (Asegúrate de tener una carpeta llamada 'public' o cambia '.' por tu directorio)
COPY ./public /usr/local/apache2/htdocs/

# 4. Exponemos los puertos: 80 para Apache y 3306 para MySQL
EXPOSE 80 3306

# 5. Comando para arrancar Apache en primer plano automáticamente
CMD ["httpd-foreground"]
