# EASY STACK GRAFANA

## Introduction
This stack provides a comprehensive monitoring and visualization solution. Grafana serves as the central dashboard, while Prometheus collects and processes metrics from various sources. Node Exporter gathers system performance data, and MySQL Exporter monitors database metrics. Fritzbox Exporter tracks router performance, and Speedtest Exporter measures network speed. Together, these components ensure detailed system and network monitoring with customizable configurations.

#### Caution! Caution! This stack is intended for development use only and is not configured for production. For production use, please refer to the "Easy-Stack-Prod" stack - comming soon.

## Important Notice

We strongly recommend changing all passwords in the `.env.dist` file. These are purely test data and should not be used even in development mode.

### How to Update Environment Variables

1. Create a `.env` file next to `.env.dist`:
   ```sh
   cp .env.dist .env
   ```
2. Open the `.env` file and update the relevant values.
3. The `.env` file will be automatically loaded if it exists and will override the corresponding environment variables.

## Installation and Starting the Application
### Prerequisites
- Docker and Docker Compose must be installed on the system.

#### Before you run this project, ensure the following are installed on your host system:

- Git
- Docker
- Docker Compose
- Make

#### Build this stack


Clone this Project

```sh
git clone git@github.com:Opillion-GmbH-Co-KG/easy-stack-grafana.git

cd ./easy-stack-grafana

 ```

To start and install this stack:

```sh
make start
 ```
or

```sh
make restart
```

## The stack up and running:
![Alt text](.makefile/assets/stack.png?raw=true" "The Stack up and running")

### Prometheus
![Alt text](.makefile/assets/prometheus.png?raw=true" "Prometheus Dashboard")

### Grafana 
##### default credentials: check env.dist 
![Alt text](.makefile/assets/grafana.png?raw=true" "Grafana login")
### Grafana Dashboard (Node-Exporter)
![Alt text](.makefile/assets/node-exporter.png?raw=true" "Node-exporter Grafana Dashboard")
### Grafana Dashboard (Fritzbox-Exporter)
![Alt text](.makefile/assets/fritzbox-exporter.png?raw=true" "Fritzbox-exporter Grafana Dashboard")
### Grafana Dashboard (Speedtest-Exporter)
![Alt text](.makefile/assets/speedtest-exporter.png?raw=true" "Speedtest-exporter Grafana Dashboard")



### Docker Container
By default, the stack consists of a single Docker container. However, you can easily add additional containers to provide various services and extend the functionality of the stack. The main container and any additional containers you configure are described below:

### **Grafana**
- **Image:** `grafana`
- **Description:** A Grafana container for monitoring and visualization.
- **Ports (preconfigured):**
    - **${GRAFANA_EXTERNAL_PORT}:${GRAFANA_INTERNAL_PORT}** (Default: 9009:3001)
- **Name:** `grafana`
- **Volumes:**
    - `${GRAFANA_DATA_PATH:-grafana-data}:/var/lib/grafana`
    - `./.docker/dev/grafana/provisioning:/etc/grafana/provisioning`
    - `./.docker/dev/grafana/provisioning/grafana.ini:/etc/grafana/grafana.ini`
    - `./.docker/dev/grafana/provisioning/dashboards:/etc/grafana/dashboards`
    - `./.docker/dev/grafana/provisioning/datasources:/etc/grafana/datasources`
- **User:** `grafana`

### **Prometheus**
- **Image:** `prometheus`
- **Description:** A Prometheus container for metric collection and monitoring.
- **Ports (preconfigured):**
    - **${PROMETHEUS_EXTERNAL_PORT}:${PROMETHEUS_INTERNAL_PORT}** (Default: 9091:9090)
- **Name:** `prometheus`
- **Volumes:**
    - `${PROMETHEUS_DATA_PATH:-prometheus-data}:/prometheus`
    - `./.docker/dev/prometheus/prometheus.yml:/etc/prometheus/prometheus.yml`
- **User:** `prometheus`

### **Node Exporter**
- **Image:** `node-exporter`
- **Description:** A Node Exporter container for system metrics collection.
- **Ports (preconfigured):**
    - **${NODE_EXPORTER_INTERNAL_PORT}** (Default: 9100)
- **Name:** `node-exporter`
- **Volumes:**
    - `/proc:/host/proc:ro`
    - `/sys:/host/sys:ro`
    - `/:/rootfs:ro`
- **User:** `node-exporter`

### **MySQL Exporter**
- **Image:** `mysqld-exporter`
- **Description:** A MySQL Exporter container for exposing MySQL metrics.
- **Ports (preconfigured):**
    - **${MYSQLD_EXPORTER_INTERNAL_PORT}** (Default: 9104)
- **Name:** `mysqld-exporter`
- **Volumes:**
    - `./.docker/dev/mysqld-exporter/.my.cnf:/.my.cnf:ro`
- **User:** `mysqld-exporter`

### **Fritzbox Exporter**
- **Image:** `fritzbox-exporter`
- **Description:** A Fritzbox Exporter container for monitoring Fritzbox router metrics.
- **Ports (preconfigured):**
    - **${FRITZ_BOX_INTERNAL_PORT}** (Default: 9042)
- **Name:** `fritzbox-exporter`
- **User:** `fritzbox-exporter`

### **Speedtest Exporter**
- **Image:** `speedtest-exporter`
- **Description:** A Speedtest Exporter container for network speed monitoring.
- **Ports (preconfigured):**
    - **${SPEED_TEST_INTERNAL_PORT}** (Default: 9469)
- **Name:** `speedtest-exporter`
- **User:** `speedtest-exporter`

## License Information

| Container              | License    | Description                                                        |
|------------------------|------------|--------------------------------------------------------------------|
| **Grafana**            | AGPL-3.0   | [AGPL-3.0](https://github.com/grafana/grafana)                     |
| **Prometheus**         | Apache-2.0 | [Apache-2.0](https://github.com/prometheus/prometheus)             |
| **Node Exporter**      | Apache-2.0 | [Apache-2.0](https://github.com/prometheus/node_exporter)          |
| **MySQL Exporter**     | Apache-2.0 | [Apache-2.0](https://github.com/prometheus/mysqld_exporter)        |
| **Fritzbox Exporter**  | MIT        | [MIT](https://github.com/fritzbox-exporter/fritzbox_exporter)      |
| **Speedtest Exporter** | GPL-3.0    | [GPL-3.0](https://github.com/MiguelNdeCarvalho/speedtest-exporter) |
| **Easy-Stack**         | GPL-3.0    | [GPL-3.0](https://www.gnu.org/licenses/gpl-3.0.html)               |

## This Stack is based on Easy Stack Mini

[![Easy Stack Mini - DALL-E Image](.makefile/assets/easy-stack-mini.jpg?raw=true)](https://github.com/Opillion-GmbH-Co-KG/easy-stack-mini)


