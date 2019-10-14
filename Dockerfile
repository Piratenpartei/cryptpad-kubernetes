# We use multi stage builds
FROM cryptpad-builder:latest AS build
FROM node:10-stretch-slim

RUN groupadd cryptpad -g 4001
RUN useradd cryptpad -u 4001 -g 4001 -d /cryptpad

COPY --from=build --chown=cryptpad /cryptpad /cryptpad
USER cryptpad

RUN mkdir /cryptpad/data

COPY --chown=cryptpad customize /cryptpad/customize

WORKDIR /cryptpad

# Unsafe / Safe ports
EXPOSE 3000

# Run cryptpad on startup
CMD ["server.js"]
