# Graph Protocol Agent
Helm chart deploying Graph Protocol Agent.

## TL;DR

```console
$ helm repo add vulcanlink https://vulcanlink.github.io/charts/
$ helm install my-release vulcanlink/graphprotocol-agent
```

## Introduction

This chart bootstraps a graphprotocol-agent deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

Vulcan Link charts can be used with [Kubeapps](https://kubeapps.com/) for deployment and management of Helm Charts in clusters.

## Prerequisites

- Kubernetes 1.12+
- Helm 2.12+ or Helm 3.0-beta3+
- PV provisioner support in the underlying infrastructure

## Installing the Chart
To install the chart with the release name `my-release`:

```console
$ helm install my-release vulcanlink/graphprotocol-agent
```

The command deploys graphprotocol-agent on the Kubernetes cluster in the default configuration. The [Parameters](#parameters) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
$ helm delete my-release
```

## Parameters

The following tables lists the configurable parameters of the graphprotocol-agent chart and their default values.

|                   Parameter                   |                                                                                Description                                                                                |                            Default                            |
|-----------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------|
| `global.imageRegistry`                        | Global Docker Image registry                                                                                                                                              | `nil`                                                         |
| `global.imagePullSecrets`                     | Global Docker registry secret names as an array                                                                                                                           | `[]` (does not add image pull secrets to deployed pods)       |
| `global.storageClass`                         | Global storage class for dynamic provisioning                                                                                                                             | `nil`                                                         |
| `image.registry`                              | Image registry                                                                                                                                                            | `docker.io`                                                   |
| `image.repository`                            | Image name                                                                                                                                                                | `graphprotocol/indexer-agent`                                          |
| `image.tag`                                   | Image tag                                                                                                                                                                 | `{TAG_NAME}`                                                  |
| `image.pullPolicy`                            | Image pull policy                                                                                                                                                         | `IfNotPresent`                                                |
| `image.pullSecrets`                           | Specify Image pull secrets                                                                                                                                                | `nil` (does not add image pull secrets to deployed pods)      |
| `image.command`                               | Specify Image run command                                                                                                                                       | `nil`                                                    |
| `image.args`                                  | Specify Image run command args                                                                                                                                  | `nil` |                                                      |
| `nameOverride`                                | String to partially override graphprotocol-agent.fullname template with a string (will prepend the release name)                                                                   | `nil`                                                         |
| `fullnameOverride`                            | String to fully override graphprotocol-agent.fullname template with a string                                                                                                       | `nil`                                                         |
| `service.type`                                | Kubernetes Service type                                                                                                                                                   | `ClusterIP`                                                   |
| `service.http`                                | graphprotocol-agent Service http port                                                                                                                                           | `7600`                                                        |
| `service.management`                                  | graphprotocol-agent Service Management API port                                                                                                                                      | `7300`                                                        |
| `service.metrics`                                  | graphprotocol-agent Service Prometheus metrics port                                                                                                                                      | `8000`                                                        |
| `service.nodePort`                            | Kubernetes Service nodePort                                                                                                                                               | `nil`                                                         |
| `service.annotations`                         | Annotations for graphprotocol-agent service                                                                                                                                              | `{}` (evaluated as a template)                                |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
$ helm install my-release vulcanlink/graphprotocol-agent --set fullNameOverride=indexer-agent
```

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```console
$ helm install my-release -f values.yaml vulcanlink/graphprotocol-agent
```

> **Tip**: You will need to update the missing placeholder parameters (eg. `config.INDEXER_AGENT_MNEMONIC`) to override the [values.yaml](values.yaml) file.