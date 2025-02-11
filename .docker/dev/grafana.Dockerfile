ARG BASE_IMAGE_TAG=latest
ARG DOCKER_REPO_NAME=opillion
FROM ${DOCKER_REPO_NAME}/grafana:${BASE_IMAGE_TAG}

ENV GF_AUTH_DISABLE_LOGIN_FORM "false"
# Allow anonymous authentication or not
ENV GF_AUTH_ANONYMOUS_ENABLED "false"
# Role of anonymous user
ENV GF_AUTH_ANONYMOUS_ORG_ROLE "Admin"
# Install plugins here our in your own config file
#ENV GF_INSTALL_PLUGINS "grafana-clock-panel, grafana-simple-json-datasource"

ADD .docker/dev/grafana/certs/grafana.crt /etc/grafana/grafana.crt
ADD .docker/dev/grafana/certs/grafana.key /etc/grafana/grafana.key

# Add provisioning
#ADD .docker/dev/grafana/provisioning /etc/grafana/provisioning
#ADD .docker/dev/grafana/provisioning/grafana.ini /etc/grafana/grafana.ini
#ADD .docker/dev/grafana/provisioning/dashboards /etc/grafana/dashboards
#ADD .docker/dev/grafana/provisioning/datasources /etc/grafana/datasources

## Add Custom Navi
#COPY .docker/dev/grafana/views /usr/share/grafana/public/views


