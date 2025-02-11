ARG BASE_IMAGE_TAG=latest
ARG DOCKER_REPO=opillion
FROM ${DOCKER_REPO}/speedtest-exporter:${BASE_IMAGE_TAG}
