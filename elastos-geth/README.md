# ELASTOS ETH Sidechain
Helm chart deploying a ELASTOS Ethereum Sidechain node.

[ELASTOS](https://www.elastos.org/) is Delegated Proof-Of-Stake (DPOS) blockchain with an Ethereum sidechain.

Checkout out [elaeth.io](https://elaeth.io/) to learn how to build smart contracts on the ELASTOS Ethereum sidechain.

## TL;DR

```console
$ helm repo add vulcanlink https://vulcanlink.github.io/charts/
$ helm install my-release vulcanlink/elastos-geth
```

## Introduction

This chart bootstraps a [ELASTOS Sidechain](https://github.com/elastos/Elastos.ELA.SideChain.ETH) deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

Vulcan Link charts can be used with [Kubeapps](https://kubeapps.com/) for deployment and management of Helm Charts in clusters. This chart has been tested to work with NGINX Ingress on top of AWS EKS.

## Prerequisites

- Kubernetes 1.12+
- Helm 2.12+ or Helm 3.0-beta3+
- PV provisioner support in the underlying infrastructure

## Installing the Chart
To install the chart with the release name `my-release`:

```console
$ helm install my-release vulcanlink/elastos-geth
```

The command deploys ELASTOS Geth on the Kubernetes cluster in the default configuration. The [Parameters](#parameters) section lists the parameters that can be configured during installation.

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

> **Note**: Deleting the PVC's will delete postgresql data as well. Please be cautious before doing it.

## Parameters

The following tables lists the configurable parameters of the ELASTOS Ethereum chart and their default values.

|                   Parameter                   |                                                                                Description                                                                                |                            Default                            |
|-----------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------|
| `persistence.enabled`                        | Enable persistent volume storage                                                                                                                                            | `true`                                                         |