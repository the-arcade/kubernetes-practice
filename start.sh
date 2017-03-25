#!/bin/bash

# build image
docker images | grep cluster-api > /dev/null 2>&1
STATUS=$?
if [ $STATUS -eq 1 ]
    then docker build -t djeffer/cluster-api .
fi

# create or replace deployment
kubectl get deployments | grep cluster-api > /dev/null 2>&1
STATUS=$?
if [ $STATUS -eq 0 ]
    then kubectl replace -f deployment.yml
    else kubectl create -f deployment.yml
fi

# create service
kubectl get services | grep cluster-api > /dev/null 2>&1
STATUS=$?
if [ $STATUS -eq 1 ]
    then kubectl expose deployment cluster-api --type=LoadBalancer
fi

# view service in browser
minikube service cluster-api
