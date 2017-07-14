FROM drush/drush:7
RUN apt-get update && apt-get install -y \  
    libpq-dev \
    postgresql-client
RUN docker-php-ext-install pdo_pgsql
RUN drush dl drush_situs
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
