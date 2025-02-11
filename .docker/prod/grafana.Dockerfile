ARG BASE_IMAGE_TAG=latest
ARG DOCKER_REPO=opillion
FROM ${DOCKER_REPO}/grafana:${BASE_IMAGE_TAG}

ENV GF_AUTH_DISABLE_LOGIN_FORM "false"
ENV GF_AUTH_ANONYMOUS_ENABLED "false"
ENV GF_AUTH_ANONYMOUS_ORG_ROLE "Admin"

ADD .docker/prod/grafana/certs/grafana.crt /etc/grafana/grafana.crt
ADD .docker/prod/grafana/certs/grafana.key /etc/grafana/grafana.key
ADD .docker/prod/grafana/provisioning/grafana.ini /etc/grafana/grafana.ini
# ADD .docker/prod/grafana/provisioning/dashboards/ /etc/grafana/dashboards/
ADD .docker/prod/grafana/provisioning/datasources/ /etc/grafana/datasources/
ADD .docker/dev/grafana/plugins/ /var/lib/grafana/plugins/

