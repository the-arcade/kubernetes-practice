#!/bin/bash

# build image
docker images | grep djeffer/cluster-api > /dev/null 2>&1
STATUS=$?
if [ $STATUS -eq 1 ]
    then docker build -t djeffer/cluster-api .
fi

# create or replace pod
kubectl get pods | grep pod-hello-world > /dev/null 2>&1
STATUS=$?
if [ $STATUS -eq 0 ]
    then kubectl replace --force -f pod.yml # force flag required for pod - causes a service outage
    else kubectl create -f pod.yml
fi

# create service
kubectl get services | grep pod-hello-world > /dev/null 2>&1
STATUS=$?
if [ $STATUS -eq 1 ]
    then kubectl expose pod pod-hello-world --type=LoadBalancer
fi

# view service in browser
minikube service pod-hello-world
