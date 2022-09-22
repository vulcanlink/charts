# Lighthouse
Helm chart deploying RUST Eth 2.0 Client Lighthouse.

https://github.com/sigp/lighthouse

## Values
See [base/README.md](../base/README.md) for more info on how to override default values. 
You will have to override the values under the `base` key. The following example overrides the name of the deployed templates:
```yaml
base:
  nameOverride: example
```

## System Requirements
https://lighthouse-book.sigmaprime.io/system-requirements.html

## Docker
https://lighthouse-book.sigmaprime.io/docker.html

```
docker run -p 9000:9000/tcp -p 9000:9000/udp -p 127.0.0.1:5052:5052 -v $HOME/.lighthouse:/root/.lighthouse sigp/lighthouse lighthouse --network mainnet beacon --http --http-address 0.0.0.0
```

## Merge
https://lighthouse-book.sigmaprime.io/merge-migration.html

## Configuration
* Network
* API
* Metrics
* Ports
    - 9000/TCP 
    - 9000/UDP

* Volumes

https://lighthouse-book.sigmaprime.io/advanced_networking.html
**Relevant Flags**
```
--eth1    If present the node will connect to an eth1 node. 
          This is required for block production, you must use this flag if you wish to serve a validator
--http    Enable the RESTful HTTP API server. Disabled by default.
```