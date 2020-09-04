#!/bin/bash

# helm package
#helm package bitcoind
#helm package ipfs
#helm package lnd
#helm package parity
#helm package geth
#helm package blockchain

helm package chainlink
helm package chainlink-gas-updater
helm package chainlink-onchain-exporter
helm package eth-failover
helm package elastos-geth
helm package geth
helm package rskj

helm package rsk-initiator
helm package rsktx-adapter

helm package chainlink-graphql
helm package vulcan-api
helm package vulcan-gateway

helm package graphprotocol-agent
helm package graphprotocol-indexnode
helm package graphprotocol-querynode
helm package graphprotocol-service

helm dependency update vulcan-chart
helm package vulcan-chart

# helm repo index
helm repo index . 
git add .