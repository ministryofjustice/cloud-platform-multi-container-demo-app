
## Installing the Chart

To install the chart:
```

helm install . \
  --name content-api \
  --values values-content-api.yaml \
  --namespace <namespace-name>

```

The ```namespace-name``` here is the environment name (namespace) you've created in the [Creating a Cloud Platform Environment](https://ministryofjustice.github.io/cloud-platform-user-docs/cloud-platform/env-create/#creating-a-cloud-platform-environment) guide.

There are a number of install switches available. Please visit the [Helm docs](https://docs.helm.sh/helm/#helm-install) for more information. 

## Deleting the Chart
To delete the installation from your cluster:
```
helm del --purge content-api
```
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