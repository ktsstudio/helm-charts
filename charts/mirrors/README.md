# mirrors

`mirrors` is a custom Kubernetes controller operating with special [CRD](https://kubernetes.io/docs/concepts/extend-kubernetes/api-extension/custom-resources/) objects.
Main purpose of `mirrors` currently is to copy Kubernetes Secret objects to and from various locations. 
More information can be found [here](https://github.com/ktsstudio/mirrors).

This chart sets up the controller and CRDs used by mirrors controller

Get Repo Info
```shell
helm repo add kts https://charts.kts.studio
helm repo update
```

# Installation

### Install chart

By default, the chart installs CRDs, the controller itself, validating and mutating webhooks, 
and also all the necessary RBAC rules.

```shell
helm upgrade --install [RELEASE_NAME] kts/mirrors
```

If you want to opt out of webhooks creating run this:
```shell
helm upgrade --install [RELEASE_NAME] kts/mirrors --set webhooks.enabled=false
```

If you want to opt out of enabling RBAC-proxy container which protects the 
/metrics endpoint you can run
```shell
helm upgrade --install [RELEASE_NAME] kts/mirrors --set rbacProxy.enabled=false
```

### Uninstall Chart
```shell
helm uninstall [RELEASE_NAME]
```

This removes all the Kubernetes components associated with the chart and deletes the release.

# Configuration
You can find all the chart values at `values.yaml` file, or run these configuration commands:

```shell
helm show values kts/mirrors
```
