# Learn Consul Cluster Peering

This is a companion repo to the [Connect Services in Different Consul Clusters with Cluster Peering tutorial](https://developer.hashicorp.com/consul/tutorials/developer-mesh/cluster-peering-aws), containing sample configuration to:

- Deploy two Kubernetes clusters with Consul
- Deploy HashiCups frontend in the first Kubernetes cluster
- Deploy HashiCups backend in the second Kubernetes cluster
- Configure Consul cluster peering between the two clusters
- Export the HashiCups `products-api` service in the second datacenter 
- Connect the HashiCups frontend and backend via the cluster peering
- Verify peered Consul services
- Destroy environment

# Thanks

This repository has borrowed code from the following other repositories. Thank you!

- https://github.com/vanphan24/cluster-peering-demo
- https://github.com/hashicorp/learn-terraform-provision-aks-cluster

## Docker Desktop

Create a Kubernetes cluster in Docker Desktop.

### Generate kubeconfig

```powershell
kubectl config view --minify --flatten > docker-desktop/dc1/edge/kubeconfig_edge
```

### Install

```powershell
terraform -chdir=docker-desktop/dc1 apply -auto-approve 
```

### Uninstall

```powershell
terraform -chdir=docker-desktop/dc1 destroy -auto-approve
```

### Check if it works

```powershell
kubectl get pods --all-namespaces
```

### Check errors

```powershell
kubectl get events --all-namespaces  --sort-by='.metadata.creationTimestamp'
```
