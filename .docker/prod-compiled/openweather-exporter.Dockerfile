ARG PROD_IMAGE_TAG=latest
ARG DOCKER_REPO=opillion
FROM ${DOCKER_REPO}/openweather-exporter:${PROD_IMAGE_TAG}
