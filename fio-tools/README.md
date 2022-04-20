# Base Dependency
An example chart using the [base](../base) chart to quickly bootstrap a simple chart.

## Base Dependency
See [base/README.md](../base/README.md) for more info on how to override default values. 
You will have to override the values under the `base` key. The following example overrides the name of the deployed templates:
```yaml
base:
  nameOverride: example
```