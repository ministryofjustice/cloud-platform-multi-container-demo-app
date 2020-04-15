# Multi Container Ruby App Helm Chart
## Introduction
This directory contains the necessary files required to install the MoJ Multi Container Ruby application via the Helm package manager. This application is intended to be used to demonstrate the ease of deployment on a MoJ Cloud Platform. 

Each component(API server, postgres, worker, rails app) of this application is the subchart. 

For the local instance of the application you can run Postgres in an ephemeral docker container by enabling the `postgres.enabled:true` in `values.yaml`

When deploying to [cloud platform][cloudplatform] setup an RDS instance using the [terraform module] (https://github.com/ministryofjustice/cloud-platform-terraform-rds-instance) and set the $DATABASE_URL from the kubernetes secret created. 

## Installing the Chart
To install the chart:
```

helm install --debug . --name multi-container-app --values values.yaml --namespace <namespace-name> --set postgresurl=DATABASE_URL

```

The ```namespace-name``` here is the environment name (namespace) you've created in the [Creating a Cloud Platform Environment](https://ministryofjustice.github.io/cloud-platform-user-docs/cloud-platform/env-create/#creating-a-cloud-platform-environment) guide.

The ```DATABASE_URL``` is the full url required to access the postgres database in the format ```postgres://<USERNAME>:<PASSWORD>@<HOST URL>:5432/<DATABASE NAME>```. This can also be fetched from the [.env](https://github.com/ministryofjustice/cloud-platform-multi-container-demo-app/blob/master/.env) file.

There are a number of install switches available. Please visit the [Helm docs](https://docs.helm.sh/helm/#helm-install) for more information. 

## Deleting the Chart
To delete the installation from your cluster:
```
helm del --purge multi-container-app
```
## Configuration
### Parent chart - multi-container-app

| Parameter  | Description     | Default |
| ---------- | --------------- | ------- |
| `global.postgresurl` | Full database url as mentioned in .env file | `$DATABASE_URL` |


## Configuration


| Parameter  | Description     | Default |
| ---------- | --------------- | ------- |
| `replicaCount` | Used to set the number of replica pods used. | `1` |
| `image.repository` | The image repository location. | `ministryofjustice/cloud-platform-multi-container-demo-app`|
| `image.tag` | The image tag. | `worker-1.4` |
| `image.pullPolicy` | Whether the image should pull | `IfNotPresent` |
| `containetPort` | Container port to be used by the service  | `Always` |

### Subchart - content-api

## Configuration
| Parameter  | Description     | Default |
| ---------- | --------------- | ------- |
| `replicaCount` | Used to set the number of replica pods used. | `1` |
| `image.repository` | The image repository location. | `ministryofjustice/cloud-platform-multi-container-demo-app`|
| `image.tag` | The image tag. | `latest` |
| `image.pullPolicy` | Whether the image should pull | `IfNotPresent` |
| `containetPort` | Container port to be used by the service  | `Always` |
| `service.type` | The type of service you wish to use | `ClusterIP` |
| `service.port` | The port your service will use | `4567` |
| `service.targetPort` | The container port service will target for | `4567` |

### Subchart - worker



## Chart Structure
### Chart.yaml
The YAML for our chart. This contains our API version, chart description, name and version. 

### values.yaml
The default configuration values for this chart.

### charts/
A directory containing all subcharts upon which this chart depends.



## Installing the Chart
This is to install postgres database in a ephemeral docker container using [https://github.com/helm/charts/tree/master/stable/postgresql](https://github.com/helm/charts/tree/master/stable/postgresql)

To install the chart:
```

helm install posgres stable/posgresql \
  --values values-postgres.yaml \
  --namespace <namespace-name>

```

The ```namespace-name``` here is the environment name (namespace) you've created in the [Creating a Cloud Platform Environment](https://ministryofjustice.github.io/cloud-platform-user-docs/cloud-platform/env-create/#creating-a-cloud-platform-environment) guide.

There are a number of install switches available. Please visit the [Helm docs](https://docs.helm.sh/helm/#helm-install) for more information. 

## Deleting the Chart
To delete the installation from your cluster:
```
helm del --purge postgres
```
## Configuration
| Parameter  | Description     | Default |
| ---------- | --------------- | ------- |
| `replicaCount` | Used to set the number of replica pods used. | `1` |
| `image.repository` | The image repository location. | `bitnami/postgresql`|
| `image.tag` | The image tag. | `latest` |
| `existingSecret` | Kubernetes secret where the postgres passwords are stored | `container-postgres-secrets` |
| `postgresqlDatabase` | Database name  | `multi_container_demo_app` |
| `persistence.enabled` | Enable persistence using PVC. | `false` |

## Secrets
Change the `container-postgres-secrets.yaml` file to set the password for admin user `postgres`. Refer parameters section of [postgres helm chart](https://github.com/helm/charts/tree/master/stable/postgresql) 

