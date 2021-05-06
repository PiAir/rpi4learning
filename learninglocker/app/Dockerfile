FROM node:10.24.0-buster AS NodeBuildEnv

ENV LL_TAG=7.0.0
ENV RELEASE=https://github.com/LearningLocker/learninglocker/archive/refs/tags/v${LL_TAG}.tar.gz

SHELL [ "/bin/bash", "-c" ]

WORKDIR /usr/src

RUN chown node:node -R /usr/src

USER node

RUN curl -L -o /tmp/source.tar.gz "${RELEASE}" && \
      tar --strip-components=1 -xvf /tmp/source.tar.gz && \
      env \
        CXXFLAGS="-Wno-error=cast-function-type -Wno-error=ignored-qualifiers -Wno-error=stringop-truncation" \
        npm_config_build_from_source="true" \
        yarn --ignore-engines --frozen-lockfile install && \
      touch .env && \
      yarn build-all && \
      yarn cache clean