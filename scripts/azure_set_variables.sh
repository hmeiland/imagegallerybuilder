#!/bin/bash

mkdir -p /var/lib/azurehpc/

META_SKU=$(curl -s -H Metadata:true --noproxy "*" "http://169.254.169.254/metadata/instance?api-version=2020-06-01" | jq -r .compute.vmSize)
META_LOCATION=$(curl -s -H Metadata:true --noproxy "*" "http://169.254.169.254/metadata/instance?api-version=2020-06-01" | jq -r .compute.location)
NVME=false

case "$META_SKU" in
  Standard_HC44rs)
    SKU=hc44rs
    ;;
  Standard_HB120rs_v2)
    SKU=hb120rsv2
    NVME=true
    ;;
  *)
    SKU=generic
    ;;

echo "export AZURE_SKU=${SKU}" > /var/lib/azurehpc/azure_variables.sh
echo "export AZURE_NVME=${NVME}" >> /var/lib/azurehpc/azure_variables.sh
echo "export AZURE_LOCATION=${META_LOCATION}" >> /var/lib/azurehpc/azure_variables.sh
