FROM mcr.microsoft.com/devcontainers/php:1-${templateOption:imageVariant}


# Install Postgres Client
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -y postgresql-client libpq-dev \ 
    && apt-get clean -y && rm -rf /var/lib/apt/lists/*

# Install php-mysql driver
RUN docker-php-ext-install pdo pdo_pgsql



# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends python3-poetry python3-dev
