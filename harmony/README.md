# Harmony
An chart to deploy a [Harmony](https://www.harmony.one/) node.

## Base Dependency
See [base/README.md](../base/README.md) for more info on how to override default values. 
You will have to override the values under the `base` key. The following example overrides the name of the deployed templates:
```yaml
base:
  nameOverride: example
```

## Sync
### Check Sync Status
Expose the rpc service to your local machine.
```
kubectl port-forward svc/harmony-rpc 9500:9500
```
Use the `hmy` tool with a Docker container on the localhost network.
```
docker run --net=host -ti vulcanlink/hmy sh
hmy utility metadata
hmy blockchain latest-headers
```