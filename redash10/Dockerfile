FROM node:12 as frontend-builder

# Controls whether to build the frontend assets
ARG skip_frontend_build

ENV CYPRESS_INSTALL_BINARY=0
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=1

RUN useradd -m -d /frontend redash
USER redash

WORKDIR /frontend
COPY --chown=redash package.json package-lock.json /frontend/
COPY --chown=redash viz-lib /frontend/viz-lib

# Controls whether to instrument code for coverage information
ARG code_coverage
ENV BABEL_ENV=${code_coverage:+test}

RUN if [ "x$skip_frontend_build" = "x" ] ; then npm ci --unsafe-perm; fi

COPY --chown=redash client /frontend/client
COPY --chown=redash webpack.config.js /frontend/
RUN if [ "x$skip_frontend_build" = "x" ] ; then npm run build; else mkdir -p /frontend/client/dist && touch /frontend/client/dist/multi_org.html && touch /frontend/client/dist/index.html; fi

FROM python:3.7-slim

EXPOSE 5000

# Controls whether to install extra dependencies needed for all data sources.
ENV skip_ds_deps=yes
# Controls whether to install dev dependencies.
ENV skip_dev_deps=yes

RUN useradd --create-home redash

# Ubuntu packages
RUN apt-get update && \
  apt-get install -y \
    curl \
    gnupg \
    build-essential \
    pwgen \
    libffi-dev \
    sudo \
    git-core \
    wget \
    # Postgres client
    libpq-dev \
    # ODBC support:
    g++ unixodbc-dev \
    # for SAML
    xmlsec1 \
    # Additional packages required for data sources:
    libssl-dev \
    default-libmysqlclient-dev \
    freetds-dev \
    libsasl2-dev \
    unzip \
    libsasl2-modules-gssapi-mit 

WORKDIR /app

# Disalbe PIP Cache and Version Check
ENV PIP_DISABLE_PIP_VERSION_CHECK=1
ENV PIP_NO_CACHE_DIR=1

# rollback pip version to avoid legacy resolver problem
RUN pip install pip==20.2.4;

COPY requirements_all_ds.txt ./
RUN if [ "x$skip_ds_deps" = "x" ] ; then pip install -r requirements_all_ds.txt ; else echo "Skipping pip install -r requirements_all_ds.txt" ; fi

COPY requirements_bundles.txt requirements_dev.txt ./
RUN if [ "x$skip_dev_deps" = "x" ] ; then pip install -r requirements_dev.txt ; fi

COPY requirements.txt ./
RUN pip install -r requirements.txt

COPY . /app
COPY --from=frontend-builder /frontend/client/dist /app/client/dist
RUN chown -R redash /app
USER redash

ENTRYPOINT ["/app/bin/docker-entrypoint"]
CMD ["server"]
