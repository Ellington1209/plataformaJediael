# Escolha a imagem base do PHP (com Apache)
FROM php:8.1-apache

# Instala as dependências necessárias
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Cria diretório para sessões e configura permissões
RUN mkdir -p /var/lib/php/sessions && \
    chmod 777 /var/lib/php/sessions

# Configura o PHP para usar o diretório de sessões
RUN echo "session.save_path = \"/var/lib/php/sessions\"" >> /usr/local/etc/php/conf.d/sessions.ini && \
    echo "session.save_handler = files" >> /usr/local/etc/php/conf.d/sessions.ini

# Copia o código do projeto para o diretório do Apache
COPY . /var/www/html/

# Configura o diretório de trabalho
WORKDIR /var/www/html

# Expõe a porta do Apache (porta 80)
EXPOSE 80
