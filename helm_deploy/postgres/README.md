
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