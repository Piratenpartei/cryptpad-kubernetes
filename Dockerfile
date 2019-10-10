# We use multi stage builds
FROM cryptpad-builder:latest AS build
FROM node:10-stretch-slim

RUN useradd cryptpad -d /cryptpad

COPY --from=build --chown=cryptpad /cryptpad /cryptpad
USER cryptpad

RUN mkdir /cryptpad/data
VOLUME /cryptpad/data

COPY customize /cryptpad/customize
COPY config /cryptpad/config

WORKDIR /cryptpad

# Unsafe / Safe ports
EXPOSE 3000 3001

# Run cryptpad on startup
CMD ["server.js"]