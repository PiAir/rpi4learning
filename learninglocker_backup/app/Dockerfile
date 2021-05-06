FROM node:10.24.0-buster AS NodeBuildEnv

ARG RELEASE=https://github.com/LearningLocker/learninglocker/archive/refs/tags/v6.4.0.tar.gz
ARG RELEASESHA256=ac1b86b57a69d1c8cbfad896e2d3387537287f88367b49dcf7ba1879a5a69cc5

SHELL [ "/bin/bash", "-c" ]

WORKDIR /usr/src

RUN chown node:node -R /usr/src

USER node

RUN curl -L -o /tmp/source.tar.gz "${RELEASE}" && \
      <<<"${RELEASESHA256}  /tmp/source.tar.gz" sha256sum -c && \
      tar --strip-components=1 -xvf /tmp/source.tar.gz && \
      env \
        CXXFLAGS="-Wno-error=cast-function-type -Wno-error=ignored-qualifiers -Wno-error=stringop-truncation" \
        npm_config_build_from_source="true" \
        yarn --ignore-engines --frozen-lockfile install && \
      touch .env && \
      yarn build-all && \
      yarn cache clean