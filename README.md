# Sowa
Repo for Sowa kubernetes example.

1. Install docker: <br>
https://docs.docker.com/engine/install/ubuntu/

2. Add user to docker group: 

Add user to docker group: <br>
```sudo groupadd docker``` <br>
Add your user to the docker group. <br>
```sudo usermod -aG docker $USER```

2. Install minikube: <br>
https://minikube.sigs.k8s.io/docs/start/

Start minikube with --driver=docker: <br>
```minikube start --driver=docker```

3. Dashboard (unsecure!!): <br>
```kubectl proxy --address='0.0.0.0' --disable-filter=true```

Web Access:
```http://<host>:8001/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/#/workloads?namespace=default```

4. Install Helm <br>
```wget https://get.helm.sh/helm-v3.4.1-linux-amd64.tar.gz
tar xvf helm-v3.4.1-linux-amd64.tar.gz
helm version
helm repo add elastic https://helm.elastic.co```
