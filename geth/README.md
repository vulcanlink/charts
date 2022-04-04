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