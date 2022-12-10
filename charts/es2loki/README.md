# es2loki

`es2loki` is a migration library that helps to transfer logs from
Elasticsearch to Grafana Loki.

More information can be found [here](https://github.com/ktsstudio/es2loki).

This chart sets up es2loki Job with an optional PostgreSQL database for a state storage.

Get Repo Info
```shell
helm repo add kts https://charts.kts.studio
helm repo update
```

# Installation

### Install chart

```shell
helm upgrade --install [RELEASE_NAME] kts/es2loki
```

### Uninstall Chart
```shell
helm uninstall [RELEASE_NAME]
```

This removes all the Kubernetes components associated with the chart and deletes the release.

# Configuration
You can find all the chart values at `values.yaml` file, or run these configuration commands:

```shell
helm show values kts/es2loki
```

You may specify environment values for `es2loki` inside the `env` section in the `values.yaml` file.
