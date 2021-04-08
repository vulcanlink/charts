# Chainlink Helm Chart
Helm chart deploying a [http://chain.link/](Chainlink) oracle node.

## TL;DR

```console
$ helm repo add vulcanlink https://vulcanlink.github.io/charts/
$ helm install my-release vulcanlink/chainlink
```

## Introduction

This chart bootstraps a [chainlink](https://github.com/smartcontractkit/chainlink) deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

Vulcan Link charts can be used for deployment and management of Helm Charts in Kubernetes clusters.

## Prerequisites

- Kubernetes 1.12+
- Helm 3.0+
- PV provisioner support in the underlying infrastructure

## Installing the Chart
To install the chart with the release name `my-release`:

```console
$ helm install my-release vulcanlink/chainlink
```

The command deploys the chart on the Kubernetes cluster in the default configuration. The [Parameters](#parameters) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
$ helm delete my-release
```

The command removes all the Kubernetes components but PVC's associated with the chart and deletes the release.

To delete the PVC's associated with `my-release`:

```console
$ kubectl delete pvc -l release=my-release
```

> **Note**: Deleting the PVC's will delete blockchain data as well. Please be cautious before doing it.

## Parameters

The following tables lists the configurable parameters of the chart and their default values.

|                   Parameter                   |                                                                                Description                                                                                |                            Default                            |
|-----------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------|
| `global.imageRegistry`                        | Global Docker Image registry                                                                                                                                              | `nil`                                                         |
| `global.imagePullSecrets`                     | Global Docker registry secret names as an array                                                                                                                           | `[]` (does not add image pull secrets to deployed pods)       |
| `global.storageClass`                         | Global storage class for dynamic provisioning                                                                                                                             | `nil`                                                         |
| `image.registry`                              | Image registry                                                                                                                                                            | `docker.io`                                                   |
| `image.repository`                            | Image name                                                                                                                                                                | `smartcontract/chainlink`                                          |
| `image.tag`                                   | Image tag                                                                                                                                                                 | `{TAG_NAME}`                                                  |
| `image.pullPolicy`                            | Image pull policy                                                                                                                                                         | `IfNotPresent`                                                |
| `image.pullSecrets`                           | Specify Image pull secrets                                                                                                                                                | `nil` (does not add image pull secrets to deployed pods)      |
| `image.command`                               | Specify Image run command                                                                                                                                       | `nil`                                                    |
| `image.args`                                  | Specify Image run command args                                                                                                                                  | `["--rpc", "--rpcaddr", "0.0.0.0", "--rpcvhosts=*", "--ws", "--wsaddr", "0.0.0.0", "--wsorigins=*"]` |                                                      |
| `nameOverride`                                | String to partially override postgresql.fullname template with a string (will prepend the release name)                                                                   | `nil`                                                         |
| `fullnameOverride`                            | String to fully override postgresql.fullname template with a string                                                                                                       | `nil`                                                         |
| `service.type`                                | Kubernetes Service type                                                                                                                                                   | `ClusterIP`                                                   |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
$ helm install my-release \
  --set image.tag=0.10.3 \
    vulcanlink/chainlink
```

The above command overrides the default Docker image tag, installing a custom version.

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```console
$ helm install my-release -f values.yaml vulcanlink/chainlink
```

> **Tip**: You can use the default [values.yaml](values.yaml)