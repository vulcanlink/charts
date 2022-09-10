#!/bin/bash
# Base
helm package base
helm package base-dependency

# Chainlink
helm package chainlink
helm package chainlink-adapter

# Ethereum
helm package geth

# Matic
helm package matic-heimdall

# helm repo index
helm repo index . 
git add .