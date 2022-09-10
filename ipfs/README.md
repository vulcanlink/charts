# Base Dependency
An IPFS Deployment Chart.
## Base Dependency
See [base/README.md](../base/README.md) for more info on how to override default values. 
You will have to override the values under the `base` key. The following example overrides the name of the deployed templates:
```yaml
base:
  nameOverride: example
```

## Configure
```
ipfs config API.HTTPHeaders.Access-Control-Allow-Methods '["GET", "POST", "PUT"]' --json
ipfs config API.HTTPHeaders.Access-Control-Allow-Origin '["*"]' --json

ipfs config Gateway.Writable true --json
ipfs config Gateway.HTTPHeaders.Access-Control-Allow-Methods '["GET", "POST", "PUT"]' --json

ipfs config Addresses.Announce '["/ip4/65.21.106.166/tcp/30401"]' --json
```
## UDP Receive Buffer Size

https://github.com/lucas-clemente/quic-go/wiki/UDP-Receive-Buffer-Size
```
kubectl ssh node
sudo sysctl -w net.core.rmem_max=2500000
```