# Geth
Helm chart deploying Matic Heimdall (Tendermint Fork).
This chart uses the [base](../base) chart to for common resources.

## Base Dependency
See [base/README.md](../base/README.md) for more info on how to override default values. 
You will have to override the values under the `base` key. The following example overrides the name of the deployed templates:
```yaml
base:
  nameOverride: example
```

## Defaults
The Heimdall node requires 3 other services to interact with. The defaults assume the following:
* Ethereum RPC: http://mainnet-rpc.ethereum:8545
* Bor RPC : http://mainnet-bor-rpc.matic:8545
* RabbitMQ: amqp://guest:guest@rabbitmq.default:5672/"

## Installation
Install with Helm using a custom values override.
```
helm install mainnet-1-heimdall matic-heimdall -f values/matic-heimdall/mainnet-1.yaml -n matic
```

## Snaphsot
Polygon provides weekly snapshots of heimdall to speed-up syncing at https://snapshots.matic.today/. Below we list a couple steps to downloading the snapshot. We recommend doing this on server with large high IOPS storage, preferrably an NVME drive ~1To or more. This should also be done on the same K8 node that will run the chart. Steps for the bor snapshot are presented for information purposes only and should only be run to setup the bor node (separate helm chart).

Download the Heimdall & Bor snapshots:
```
nohup wget https://matic-blockchain-snapshots.s3-accelerate.amazonaws.com/matic-mainnet/bor-pruned-snapshot-2022-04-04.tar.gz &
nohup wget https://matic-blockchain-snapshots.s3-accelerate.amazonaws.com/matic-mainnet/heimdall-snapshot-2022-04-04.tar.gz &
```
Untar the compressed snapshots.
```
nohup tar -xvf heimdall-snapshot-2022-04-04.tar.gz -C heimdall-snapshot-2022-04-04 &
nohup tar -xvf bor-pruned-snapshot-2022-04-04.tar.gz -C bor-pruned-snapshot-2022-04-04 &
```
If using a PVC (eg. OpenEBS), copy/move the snapshot to whatever PVC will be attached to the Heimdall Pod.
```
nohup cp -r /home/heimdall-snapshot-2022-04-04 data &
nohup cp -r /home/bor-pruned-snapshot-2022-04-04 chaindata &
```

## Health
Monitor your Matic Heimdall node's health and sync status:
```
curl http://localhost:26657/status
```

## Bor
Once your Heimdall node is synced you will also need to run Matic Bor (Geth fork) to sync the main blockchain. This is **NOT** included in this chart. We recommend using the [geth](../geth) chart along with some custom Matic specific overrides.

## Other
This guide can help you understand the general architecture of running a Matic node such as what ports are used or what other services the node interacts with.
https://chasewright.com/how-to-run-a-polygon-matic-mainnet-node/
