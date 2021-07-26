#!/bin/bash

# Chainlink
helm package chainlink
helm package chainlink-adapter
helm package chainlink-gas-updater
helm package chainlink-onchain-exporter
helm package rsk-initiator
helm package rsktx-adapter
# Ethereum
helm package eth-failover
helm package eth-geth
helm package eth-openethereum
# RSK
helm package rskj
# Matic
helm package matic-heimdall

# Vulcan Link API
helm package chainlink-graphql
helm package vulcan-api
helm package vulcan-gateway

# Graph Protocol
helm package graphprotocol-agent
helm package graphprotocol-indexnode
helm package graphprotocol-querynode
helm package graphprotocol-service
helm dependency update graphprotocol
helm package graphprotocol

# helm repo index
helm repo index . 
git add .