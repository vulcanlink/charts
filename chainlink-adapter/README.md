# chainlink-adapter
Helm chart deploying Chainlink API adapter.

## Introduction

This chart bootstraps a [chainlink-adapter](https://github.com/smartcontractkit/external-adapters-js) deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

Vulcan Link charts can be used for deployment and management of Helm Charts in Kubernetes clusters.

## Prerequisites
- Kubernetes 1.12+
- Helm 3.0+

## Installing the Chart
We go through the example of installing a chart with the release name `chainlink-adapter-1forge` for the `1forge` api.
Add the vulcanlink helm chart repo if you have not done so:
```console
helm repo add vulcanlink https://vulcanlink.github.io/charts/
```
You can now deploy either with CLI parameters or YAML file parameters.
### CLI Parameters
Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
helm install chainlink-adapter-1forge --set image.repository=public.ecr.aws/chainlink-staging/adapters/1forge-adapter,config.API_KEY=YOUR_API_KEY vulcanlink/chainlink-adapter
```

The above command overrides the `image.repository` and `config.API_KEY` values.

### YAML Parameters
Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. 
Create a `1forge.yaml` file:
```yaml
image:
  repository: "public.ecr.aws/chainlink-staging/adapters/1forge-adapter"
config:
  API_KEY: "YOUR_API_KEY"
```
Deploy the helm chart with overriden default values:
```console
helm install chainlink-adapter-1forge -f 1forge.yaml vulcanlink/chainlink-adapter
```

### Other Adapters
For deploying other adapters from [external-adapters-js](https://github.com/smartcontractkit/external-adapters-js), simply replace `1forge` with `my-adapter`. Always make sure your overridding the necessary values, especially the `image.repository` and `config.API_KEY` values. You should be running 1 release per chainlink-adapter type.

> **Tip**: List all releases using `helm list`

### Configuring Chainlink
The chainlink adapter creates 2 services on your Kubernetes cluster:
* chainlink-adapter-[ADAPTER_NAME]: the adapter service, served on port 80 and used by the Chainlink node
* chainlink-adapter-[ADAPTER_NAME]-prometheus (`prometheus: true`): a prometheus metrics endpoint on port 3000  

To configure your Chainlink node to use your deployed adapter, simply set the adapter url to:
`chainlink-adapter-[ADAPTER_NAME].default`
For our 1forge example, this amounts to:
`chainlink-adapter-1forge.default`

The above assumes the Chainlink node is running in the same Kubernetes cluster and the adapter is deployed in the `default` namespace. If you have a doubt on what services you've created, you can always list them with `kubectl get svc`.


## Uninstalling the Chart

To uninstall the `chainlink-adapter-1forge` deployment:

```console
helm uninstall chainlink-adapter-1forge
```

## Parameters

The following tables lists the configurable parameters of the chart and their default values.

|                   Parameter                   |                                                                                Description                         |                            Default                            |
|-----------------------------------------------|--------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------|
| `global.imageRegistry`                        | Global Docker Image registry                                                                                       | `nil`                                                         |
| `global.imagePullSecrets`                     | Global Docker registry secret names as an array                                                                    | `[]` (does not add image pull secrets to deployed pods)       |
| `global.storageClass`                         | Global storage class for dynamic provisioning                                                                      | `nil`                                                         |
| `image.repository`                            | Image name                                                                                                         | `chainlink-adapter`                                          |
| `image.tag`                                   | Image tag                                                                                                          | `{TAG_NAME}`                                                  |
| `image.pullPolicy`                            | Image pull policy                                                                                                  | `IfNotPresent`                                                |
| `image.pullSecrets`                           | Specify Image pull secrets                                                                                         | `nil` (does not add image pull secrets to deployed pods)      |
| `image.command`                               | Specify Image run command                                                                                          | `nil`                                                    |
| `image.args`                                  | Specify Image run command args                                                                                     | `nil` |                                                      |
| `nameOverride`                                | String to partially override chainlink-adapter.fullname template with a string (will prepend the release name)         | `nil`                                                         |
| `fullnameOverride`                            | String to fully override chainlink-adapter.fullname template with a string   | `nil`       |
| `container.ports.http`                        | Container http port  | `8080` |
| `container.ports.prometheus`                  | Container prometheus port  | `3000` |
| `service.http.type`                           | Kubernetes Service type  | `ClusterIP` |
| `service.http.port`                           | Kubernetes Service port  | `80` |
| `service.prometheus.type`                     | Kubernetes Service type  | `ClusterIP` |
| `service.prometheus.port`                     | Kubernetes Service port  | `3000` |
| `prometheus`                                  | Enable prometheus metrics  | `false` |
| `config.API_KEY`                              | Environment variable for API_KEY | `nil` |
| `config.[NAME]`                              | Environment variables injected into the docker container |  |