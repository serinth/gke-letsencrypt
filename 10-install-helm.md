<!--
Copyright 2018 Google Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    https://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
-->

**Note**: terraform files have been provided to spin up the cluster in `/gke`
`--namespace MY_NAMESPACE` can be added to the helm and kubectl commands if one of the kubernetes environments is created to the GKE cluster.

# Install Helm

Install the Helm client on your development machine:

- https://docs.helm.sh/using_helm/#installing-helm-client

Install the Helm server-side components (Tiller) on your GKE cluster:

```
kubectl create serviceaccount -n kube-system tiller
```


```
kubectl create clusterrolebinding tiller-binding \
    --clusterrole=cluster-admin \
    --serviceaccount kube-system:tiller
```

```
helm init --service-account tiller
```

Once tiller pod becomes ready, update chart repositories:

    helm repo update

-----

**Next:** [Install cert-manager &rarr;](20-install-cert-manager.md)
