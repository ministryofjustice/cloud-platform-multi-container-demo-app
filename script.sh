#!/bin/bash
# steps to reproduce
#delete k8s deployments
#find out version of makefile
#change version in makefile
#change version in k8s manifests
#make build, tag and push
#deploy k8s deployments

VERSION=$(cat makefile | grep "VERSION :=" | sed "s/VERSION := //")
NEW=$1

# Delete remaining kubernetes files
kubectl delete -f ./kubernetes_deploy/. -n jason-lab > /dev/null

# Bump the version in makefile
sed -i s/${VERSION}/${NEW}/g makefile

# Bump the version in kubernetes deployment manifests
sed -i s/${VERSION}/${NEW}/g kubernetes_deploy/*deploy*
sed -i s/${VERSION}/${NEW}/g kubernetes_deploy/rails-migrations-job.yaml

# Build, tag and push docker images
sudo make build-tag-and-push

# Deploy manifest files
kubectl create -f ./kubernetes_deploy/. -n jason-lab
