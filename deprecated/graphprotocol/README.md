# Graph Protocol Chart Bundle
Helm chart deploying 4 Graph Protocol Charts:
- Graph Protocol Agent
- Graph Protocol Index Node
- Graph Protocol Query Node
- Graph Protocol Service

## TL;DR

```console
$ helm repo add vulcanlink https://vulcanlink.github.io/charts/
$ helm install my-release vulcanlink/graphprotocol
```

## Introduction

This chart bootstraps a graphprotocol deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

Vulcan Link charts can be used with [Kubeapps](https://kubeapps.com/) for deployment and management of Helm Charts in clusters.

## Prerequisites

- Kubernetes 1.12+
- Helm 2.12+ or Helm 3.0-beta3+
- PV provisioner support in the underlying infrastructure

## Secrets
Before installing the Graph Protocol chart you should setup the necessary secrets. Secrets are used to store sensitive configuration info. Non-sensitive configuration info can be stored in ConfigMaps.
The Graph Protocol chart bundle requires 3 secrets:
- Docker Secret
- Postgres Secret
- Mnemonic Secret

### Docker Secret
This secret is used to access private docker repos using authentification. See the example file at [docker.yaml](examples/docker.yaml). Once you have added your credentials to the secret apply it as such:
```
kubectl apply -f docker.yaml
```

### Postgres Secret
This secret is used to access your Postgres server.  See the example file at [postgres-credentials.yaml](examples/postgres-credentials.yaml). The Graph Protocol chart assumes that the graph, index-agent, and index-service databases are all hosted on the same Postgres server requiring the same auth info. Once you have added the host and password values to the secret apply it as such:
```
kubectl apply -f postgres-credentials.yaml
```

### Mnemonic Secret
This secret is used to set your Ethereum Mnemonic from which the indexer-agent and indexer-service derive their signing keys. See the example file at [ethereum-accounts.yaml](examples/ethereum-accounts.yaml). Once you have added the mnemonic value to the secret apply it as such:
```
kubectl apply -f ethereum-accounts.yaml
```

## Installing the Chart
To install the chart with the release name `my-release`:

```console
$ helm install my-release vulcanlink/graphprotocol
```

The command deploys graphprotocol on the Kubernetes cluster in the default configuration. The [Parameters](#parameters) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
$ helm delete my-release
```

## Parameters

The following tables lists the configurable parameters of the graphprotocol-agent chart and their default values. The only parameters listed here are whether to enable each component of the chart. Subchart-specific parameters can found in each subchart's respective README.md. To configure subchart parameters, prefix the parameter with the subchart name. For example, to change the indexnode replica count, update `graphprotocol-indexnode.replicaCount`. See the example [values.yaml](examples/values.yaml) file for an example of configuring the subcharts.


|                   Parameter                   |                                                                                Description                                                                                |                            Default                            |
|-----------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------|
| `graphprotocol-agent.enabled`                        | Enable Graph Protocol Agent subchart                                                                                                                                              | `true`                                                         |
| `graphprotocol-indexnode.enabled`                        | Enable Graph Protocol Index Node subchart                                                                                                                                              | `true`                                                         |
| `graphprotocol-querynode.enabled`                        | Enable Graph Protocol Query Node subchart                                                                                                                                              | `true`                                                         |
| `graphprotocol-service.enabled`                        | Enable Graph Protocol Service Node subchart                                                                                                                                              | `true`                                                         |


Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
$ helm install my-release vulcanlink/graphprotocol-agent --set graphprotocol-indexnode.enabled=false
```

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```console
$ helm install my-release -f values.yaml vulcanlink/graphprotocol-agent
```

> **Tip**: You will need to update the missing subchart placeholder parameters (eg `graphprotocol-indexnode.config.ethereum`) for the [values.yaml](values.yaml) file. See the example [values.yaml](examples/values.yaml) for an example.