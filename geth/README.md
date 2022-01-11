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