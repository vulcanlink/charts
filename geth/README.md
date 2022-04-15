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