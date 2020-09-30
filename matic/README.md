# ELASTOS ETH Sidechain
Helm chart deploying a ELASTOS Ethereum Sidechain node.

[ELASTOS](https://www.elastos.org/) is Delegated Proof-Of-Stake (DPOS) blockchain with an Ethereum sidechain.

Checkout out [elaeth.io](https://elaeth.io/) to learn how to build smart contracts on the ELASTOS Ethereum sidechain.

## TL;DR

```console
$ helm repo add vulcanlink https://vulcanlink.github.io/charts/
$ helm install my-release vulcanlink/matic
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
$ helm install my-release vulcanlink/matic
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

> **Note**: Deleting the PVC's will delete blockchain data as well. Please be cautious before doing it.

## Parameters

The following tables lists the configurable parameters of the ELASTOS Ethereum chart and their default values.

|                   Parameter                   |                                                                                Description                                                                                |                            Default                            |
|-----------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------|
| `global.imageRegistry`                        | Global Docker Image registry                                                                                                                                              | `nil`                                                         |
| `global.imagePullSecrets`                     | Global Docker registry secret names as an array                                                                                                                           | `[]` (does not add image pull secrets to deployed pods)       |
| `global.storageClass`                         | Global storage class for dynamic provisioning                                                                                                                             | `nil`                                                         |
| `image.registry`                              | Image registry                                                                                                                                                            | `docker.io`                                                   |
| `image.repository`                            | Image name                                                                                                                                                                | `vulcanlink/matic`                                          |
| `image.tag`                                   | Image tag                                                                                                                                                                 | `{TAG_NAME}`                                                  |
| `image.pullPolicy`                            | Image pull policy                                                                                                                                                         | `IfNotPresent`                                                |
| `image.pullSecrets`                           | Specify Image pull secrets                                                                                                                                                | `nil` (does not add image pull secrets to deployed pods)      |
| `image.command`                               | Specify Image run command                                                                                                                                       | `["geth"]`                                                    |
| `image.args`                                  | Specify Image run command args                                                                                                                                  | `["--rpc", "--rpcaddr", "0.0.0.0", "--rpcvhosts=*", "--ws", "--wsaddr", "0.0.0.0", "--wsorigins=*"]` |                                                      |
| `nameOverride`                                | String to partially override postgresql.fullname template with a string (will prepend the release name)                                                                   | `nil`                                                         |
| `fullnameOverride`                            | String to fully override postgresql.fullname template with a string                                                                                                       | `nil`                                                         |
| `volumes.data.mountPath`                      | Blockchain data mountpath                                                                                                                                                 | `/root/.ela_ethereum`                                             |
| `container.http`                              | Geth Container http JSON-RPC port                                                                                                                                         | `20636`                                                        |
| `container.ws`                                | Geth Container websocket JSON-RPC port                                                                                                                                    | `20635`                                                        |
| `service.type`                                | Kubernetes Service type                                                                                                                                                   | `ClusterIP`                                                   |
| `service.http`                                | Geth Service http JSON-RPC port                                                                                                                                           | `20636`                                                        |
| `service.ws`                                  | Geth Service websocket JSON-RPC port                                                                                                                                      | `20635`                                                        |
| `service.nodePort`                            | Kubernetes Service nodePort                                                                                                                                               | `nil`                                                         |
| `service.annotations`                         | Annotations for Geth service                                                                                                                                              | `{}` (evaluated as a template)                                |
| `persistence.enabled`                         | Enable persistence using PVC                                                                                                                                              | `true`                                                        |
| `persistence.existingClaim`                   | Provide an existing `PersistentVolumeClaim`, the value is evaluated as a template.                                                                                        | `nil`                                                         |
| `persistence.storageClass`                    | PVC Storage Class for Geth volume                                                                                                                                   | `nil`                                                         |
| `persistence.accessModes`                     | PVC Access Mode for Geth volume                                                                                                                                     | `[ReadWriteOnce]`                                             |
| `persistence.size`                            | PVC Storage Request for Geth volume                                                                                                                                 | `100Gi`                                                       |
| `persistence.annotations`                     | Annotations for the PVC                                                                                                                                                   | `{}`                                                          |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
$ helm install my-release \
  --set persistence.enabled=false \
    vulcanlink/matic
```

The above command disables persistent storage, meaning the node will have to resync after every Pod restart/deletion.

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```console
$ helm install my-release -f values.yaml vulcanlink/geth
```

> **Tip**: You can use the default [values.yaml](values.yaml)                               |
