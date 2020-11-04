#!/bin/bash

mkdir -p /var/lib/azurehpc/

SKU=$(curl -s -H Metadata:true --noproxy "*" "http://169.254.169.254/metadata/instance?api-version=2020-06-01" | jq -r .compute.vmSize)

echo "export AZURE_SKU=${SKU}" > /var/lib/azurehpc/azure_variables.sh
