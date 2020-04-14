
## Installing the Chart

To install the chart:
```

helm install . \
  --name worker \
  --values values-worker.yaml \
  --namespace <namespace-name> \
  --set postgresurl=$DATABASE_URL

```
The ```DATABASE_URL``` can also be fetched from the [.env](https://github.com/ministryofjustice/cloud-platform-multi-container-demo-app/blob/master/.env) file.

The ```namespace-name``` here is the environment name (namespace) you've created in the [Creating a Cloud Platform Environment](https://ministryofjustice.github.io/cloud-platform-user-docs/cloud-platform/env-create/#creating-a-cloud-platform-environment) guide.

There are a number of install switches available. Please visit the [Helm docs](https://docs.helm.sh/helm/#helm-install) for more information. 

## Deleting the Chart
To delete the installation from your cluster:
```
helm del --purge worker
```
## Configuration
| Parameter  | Description     | Default |
| ---------- | --------------- | ------- |
| `replicaCount` | Used to set the number of replica pods used. | `1` |
| `image.repository` | The image repository location. | `ministryofjustice/cloud-platform-multi-container-demo-app`|
| `image.tag` | The image tag. | `worker-1.4` |
| `image.pullPolicy` | Whether the image should pull | `IfNotPresent` |
| `containetPort` | Container port to be used by the service  | `Always` |
| `postgresurl` | Full database url as mentioned in .env file | $DATABSE_URL |

## Chart Structure
### Chart.yaml
The YAML for our chart. This contains our API version, chart description, name and version. 

### requirements.yaml
A YAML file listing dependencies for the chart.

### values.yaml
The default configuration values for this chart.

### charts/
A directory containing any charts upon which this chart depends.

### templates/ 
A directory of templates that, when combined with values, will generate valid Kubernetes manifest files.

### templates/NOTES.txt
A plain text file containing short usage notes.