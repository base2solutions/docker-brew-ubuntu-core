#!/bin/bash
set -Eeuo pipefail

usage() { echo "Usage: $0 [-r <registry_server/org>]" 1>&2; exit 1; }

registry_server_base=""

while getopts ":hr:" opt; do
  case $opt in
    r)
      registry_server_base=${OPTARG}
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      usage
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      usage
      exit 1
      ;;
    h | *) # Display help.
      usage
      exit 0
      ;;
  esac
done
shift $((OPTIND-1))

if [ -z "${registry_server_base}" ]; then
    usage
fi 

docker build --rm -t "$registry_server_base/ubuntu:18.04" bionic/
docker build --rm -t "$registry_server_base/ubuntu:18.10" -t "$registry_server_base/ubuntu:latest" cosmic/
docker build --rm -t "$registry_server_base/ubuntu:16.04" xenial/
docker build --rm -t "$registry_server_base/ubuntu:14.04.5" trusty/ 