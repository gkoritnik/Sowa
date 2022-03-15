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

Set minikube config. ELK uses more RAM then default minikube config.
```
minikube config set cpus 4
minikube config set memory 6000
```
Start minikube with --driver=docker: <br>
```minikube start --driver=docker```

3. Dashboard (unsecure!!) - optional: <br>
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

6. Use git clone to clone this repo. <br>
```git clone https://github.com/gkoritnik/Sowa.git```

7. Go to repo directory /ELK_minikube:
```
cd Sowa
cd ELK_minikube
```

8. In /ELK_minikube use helm to deploy ELK stack:
```
helm install elk . --set global.hostIp=$(minikube ip)

Result:
NAME: elk
LAST DEPLOYED: Tue Mar 15 19:16:17 2022
NAMESPACE: default
STATUS: deployed
REVISION: 1
TEST SUITE: None

```
To check pods execute command: ```minikube kubectl -- get pods -A```
sowa@sowa:~/ELK/git/Sowa/ELK_minikube$ minikube kubectl -- get pods -A
NAMESPACE     NAME                               READY   STATUS    RESTARTS      AGE
default       app-filebeat-5655c8c8c7-w6qsd      2/2     Running   0             8m22s
default       elasticsearch-54bd6987c9-chqjr     1/1     Running   0             8m22s
default       kibana-8f58899dc-p92ts             1/1     Running   0             8m22s
default       logstash-586d86679c-779z6          1/1     Running   0             8m22s
kube-system   coredns-64897985d-xc8jd            1/1     Running   0             12m
kube-system   etcd-minikube                      1/1     Running   0             12m
kube-system   kube-apiserver-minikube            1/1     Running   0             12m
kube-system   kube-controller-manager-minikube   1/1     Running   0             12m
kube-system   kube-proxy-82pfk                   1/1     Running   0             12m
kube-system   kube-scheduler-minikube            1/1     Running   0             12m
kube-system   storage-provisioner                1/1     Running   1 (11m ago)   12m
sowa@sowa:~/ELK/git/Sowa/ELK_minikube$

To check cluster services execute command ```minikube kubectl -- get service```:
sowa@sowa:~/ELK/git/Sowa/ELK_minikube$ minikube kubectl -- get service
NAME            TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)          AGE
elasticsearch   NodePort    10.103.222.166   <none>        9200:31996/TCP   9m41s
kibana          NodePort    10.106.78.106    <none>        5601:31997/TCP   9m41s
kubernetes      ClusterIP   10.96.0.1        <none>        443/TCP          13m
logstash        NodePort    10.106.55.109    <none>        5044:31998/TCP   9m41s
sowa@sowa:~/ELK/git/Sowa/ELK_minikube$

9. Forward port to access Kibana outside localhost
```kubectl port-forward --address=0.0.0.0 service/kibana 8080:5601```

10. Kibana:

Go to Logs:<br>
<p>
<img width="252" alt="image" src="https://user-images.githubusercontent.com/25821944/158456476-d2dd9918-b4ed-42e5-ac0f-bfa6400f31b1.png"> <br>
</p>
Go to settings and add CPU, Memory, Disk columns and remove columns Field and Message: <br>
<p>
<img width="143" alt="image" src="https://user-images.githubusercontent.com/25821944/158456766-fc15ae96-6e04-447a-86ee-53bd9472843f.png"> <br>
<img width="783" alt="image" src="https://user-images.githubusercontent.com/25821944/158456927-f4f80b41-80ed-447d-a536-16bea929fd17.png"> <br>
<img width="938" alt="image" src="https://user-images.githubusercontent.com/25821944/158457155-b7209f5e-287b-4940-a752-51d0fa3e97c5.png"> <br>
</p>
