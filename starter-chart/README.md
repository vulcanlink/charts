# starter-chart
Helm chart deploying starter-chart.

## TL;DR

```console
helm repo add vulcanlink https://vulcanlink.github.io/charts/
helm install my-release vulcanlink/starter-chart
```

## Introduction

This chart bootstraps a starter-chart deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

Vulcan Link charts can be used for deployment and management of Helm Charts in Kubernetes clusters.

## Prerequisites

- Kubernetes 1.12+
- Helm 3.0+
- PV provisioner support in the underlying infrastructure

## Installing the Chart
To install the chart with the release name `my-release`:

```console
helm install my-release vulcanlink/starter-chart
```

The command deploys the chart on the Kubernetes cluster in the default configuration. The [Parameters](#parameters) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
helm delete my-release
```

## Parameters

The following tables lists the configurable parameters of the chart and their default values.

|                   Parameter                   |                                                                                Description                         |                            Default                            |
|-----------------------------------------------|--------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------|
| `global.imageRegistry`                        | Global Docker Image registry                                                                                       | `nil`                                                         |
| `global.imagePullSecrets`                     | Global Docker registry secret names as an array                                                                    | `[]` (does not add image pull secrets to deployed pods)       |
| `global.storageClass`                         | Global storage class for dynamic provisioning                                                                      | `nil`                                                         |
| `image.tag`                                   | Image tag                                                                                                          | `{TAG_NAME}`                                                  |
| `image.pullPolicy`                            | Image pull policy                                                                                                  | `IfNotPresent`                                                |
| `image.pullSecrets`                           | Specify Image pull secrets                                                                                         | `nil` (does not add image pull secrets to deployed pods)      |
| `image.command`                               | Specify Image run command                                                                                          | `nil`                                                    |
| `image.args`                                  | Specify Image run command args                                                                                     | `nil` |                                                      |
| `nameOverride`                                | String to partially override starter-chart.fullname template with a string (will prepend the release name)         | `nil`                                                         |
| `fullnameOverride`                            | String to fully override starter-chart.fullname template with a string   | `nil`       |
| `container.ports.http`                        | Container http port  | `80` |
| `container.ports.prometheus`                  | Container prometheus port  | `3000` |
| `service.http.type`                           | Kubernetes Service type  | `ClusterIP` |
| `service.http.port`                           | Kubernetes Service port  | `80` |
| `service.prometheus.type`                     | Kubernetes Service type  | `ClusterIP` |
| `service.prometheus.port`                     | Kubernetes Service port  | `3000` |
| `prometheus`                                  | Enable prometheus metrics  | `false` |
| `config.[NAME]`                              | Environment variables injected into configmap |  |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
helm install my-release \
  --set image.tag=0.10.3 \
    vulcanlink/starter-chart
```

The above command overrides the default Docker image tag, installing a custom version.

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```console
helm install my-release -f values.yaml vulcanlink/starter-chart
```

> **Tip**: You can use the default [values.yaml](values.yaml)