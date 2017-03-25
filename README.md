# cluster-api
Practice with Kubernetes - make a RESTful API out of docker images in a Kubernetes pod.

## setup
[Kubernetes Hello World Tutorial](https://kubernetes.io/docs/tutorials/stateless-application/hello-minikube/#create-a-minikube-cluster)
### prerequisites
 * Docker
 * Minikube
 * Kubernetes

### start the cluster
 * `minikube start --vm-driver=xhyve`
 * `kubectl config use-context minikube`
 * `kubectl cluster-info`

### set docker to use minikube
(To gain a better understanding of what this command does, run `docker images` before and after.)
 * eval $(minikube docker-env)
Note: When you no longer want to use the Minikube host, run `eval $(minikube docker-env -u)`.

### build the image
 * `docker build -t <image-name> .`

### deploy the image to a Kubernetes Pod
 * `kubectl run <name> --image=<image-name> --port=8080`
 * `kubectl get deployments`
 * `kubectl get pods`
 * `kubectl get events`
 * `kubectl config view`

### expose the pod to the environment outside the Kubernetes virtual network (create a Service)
 * `kubectl expose deployment <name> --type=LoadBalancer`
 * `kubectl get services`
 * `minikube service <name>`
 * `kubectl logs <POD-NAME>`

### update your app
 * `add some more code`
 * `docker build -t <image-name version 2> .`
 * `kubectl set image deployment/<name> <name>=<image-name version 2>`
 * `minikube service <name>`

### clean up
 * `kubectl delete service <name>`
 * `kubectl delete deployment <name>`
 * `minikube stop`
