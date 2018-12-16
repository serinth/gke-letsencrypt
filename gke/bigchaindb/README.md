# Helm SA
Helm runs under a special service account for RBAC. You can see that in `helm-sa.yaml`

# Terraform Workspaces
- `non-prod` --active and in use
- `prod` -- not yet created

# Namespaces
There are two:
- dev
- stage

# Install BigchainDB Helm Chart
```bash
helm install ./bigchaindb --namespace dev
```

This will expose an Ingress on port 80 at a given IP address. Give it 4-5 minutes for the load balancer to recognize the change.
At this point, it's publicly exposed so make sure to do the TLS certificate process below.

Keep the bigchaindb replica to 1 because we're using the [All In One](http://docs.bigchaindb.com/projects/server/en/latest/appendices/all-in-one-bigchaindb.html?highlight=all%20in%20one) image for the pilot.

# Upgrade Helm Chart with Certificate
Get the name of the chart:
```bash
helm list
```

```bash
helm upgrade --namespace <namespace> \ 
 --set ingress.tls[0].secretName=bigchaindb-dev-tls \ 
 --set ingress.tls[0].hosts[0]=MY-DOMAIN <chart name> \ 
 ./bigchaindb
```