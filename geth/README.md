# Geth
Helm chart deploying Ethereum Go.
This chart uses the [base](../base) chart to for common resources.

## Base Dependency
See [base/README.md](../base/README.md) for more info on how to override default values. 
You will have to override the values under the `base` key. The following example overrides the name of the deployed templates:
```yaml
base:
  nameOverride: example
```

## Intallation
Install with Helm using a custom values override.
```
helm install mainnet-2 geth -f values/geth/ethereum/mainnet-2.yaml -n ethereum
```
Check logs with Kubectl
```
kubectl logs mainnet-2-0 --tail 100 -n ethereum
```
Open a debugging shell
```
kubectl exec mainnet-2-0 -n ethereum -ti -- sh
```

## Chains
Many Ethereum sidechains use geth as their original fork and therefore can be run with this chart with simple tweaks.
```
helm install mainnet-1 geth -f values/geth/ethereum/mainnet-1.yaml -n ethereum
helm install mainnet-bor-1 geth -f values/geth/matic/mainnet-1.yaml -n matic
helm install mainnet-opera-1 geth -f values/geth/fantom/mainnet-1.yaml -n fantom
helm install mainnet-harmony-1 geth -f values/geth/harmony/mainnet-1.yaml -n harmony
```

### Ethereum
https://github.com/ethereum/go-ethereum
https://hub.docker.com/r/ethereum/client-go
### Polygon
https://github.com/ma:ticnetwork/bor
https://hub.docker.com/r/maticnetwork/bor
https://snapshots.matic.today/
### BSC
https://github.com/bnb-chain/bsc
wget --no-check-certificate --no-proxy 'https://s3.ap-northeast-1.amazonaws.com/dex-bin.bnbstatic.com/s3-witness-data-download/chaindata_202103.zip?AWSAccessKeyId=AKIAYINE6SBQPUZDDRRO&Expires=1641450253&Signature=hOC8I8HSpCOytlYMVQwKRc5oUaI%3D'
### Fantom
https://github.com/Fantom-foundation/go-opera
https://hub.docker.com/r/chainstack/fantom-opera
https://docs.fantom.foundation/node/snapshot-download
### Harmony
https://github.com/harmony-one/harmony
https://hub.docker.com/r/chainstack/harmony-node
### Optimism
https://github.com/ethereum-optimism/optimism
### Arbitrum
https://github.com/OffchainLabs/arbitrum

### Boba
https://github.com/bobanetwork/boba

## Node Taints
Add a node taint to your dedicated blockchain node to avoid other workloads that could bottleneck your blockchain workload.
```
kubectl taint nodes <node> geth/1=node:NoSchedule
```

Read more about node taints in the kubernetes [docs](https://kubernetes.io/docs/concepts/scheduling-eviction/taint-and-toleration/).

## Pruning
https://gist.github.com/yorickdowne/3323759b4cbf2022e191ab058a4276b2
https://gist.github.com/yorickdowne/27d4a96174562377d86e4df5d8de654f

## Debug
Run locally
```
docker run ethereum/client-go --help
```
List accounts
```
geth account list --keystore /root/keystore
```

## Termination
Adjust termination grace period to 5m.
https://cloud.google.com/blog/products/containers-kubernetes/kubernetes-best-practices-terminating-with-grace
https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle/