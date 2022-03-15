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
```
1. wget https://get.helm.sh/helm-v3.4.1-linux-amd64.tar.gz
2. tar xvf helm-v3.4.1-linux-amd64.tar.gz
3. helm version
4. helm repo add elastic https://helm.elastic.co```
Helm version:
```
 helm version
version.BuildInfo{Version:"v3.4.1", GitCommit:"c4e74854886b2efe3321e185578e6db9be0a6e29", GitTreeState:"clean", GoVersion:"go1.14.11"}
```

5. Add elastic repository in Helm
