ARG BASE_IMAGE_TAG=latest
ARG DOCKER_REPO=opillion
FROM ${DOCKER_REPO}/prometheus:${BASE_IMAGE_TAG}

ADD .docker/prod/prometheus/prometheus.yml /etc/prometheus/prometheus.yml
