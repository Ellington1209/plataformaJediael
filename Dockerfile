# Escolha a imagem base do PHP (com Apache)
FROM php:8.1-apache

# Instala as dependências necessárias
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Copia o código do projeto para o diretório do Apache
COPY . /var/www/html/

# Configura o diretório de trabalho
WORKDIR /var/www/html

# Expõe a porta do Apache (porta 80)
EXPOSE 80
