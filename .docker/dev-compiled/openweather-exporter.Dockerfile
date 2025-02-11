ARG DEV_IMAGE_TAG=latest
ARG DOCKER_REPO=opillion
FROM ${DOCKER_REPO}/openweather-exporter:${DEV_IMAGE_TAG}
