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
helm upgrade --install RELEASE_NAME kts/es2loki
```

### Uninstall Chart
```shell
helm uninstall RELEASE_NAME
```

This removes all the Kubernetes components associated with the chart and deletes the release.

# Configuration
You can find all the chart values at `values.yaml` file, or run these configuration commands:

```shell
helm show values kts/es2loki
```

You may specify environment values for `es2loki` inside the `env` section in the `values.yaml` file.

## PostgreSQL

By default this chart installs a PostgreSQL instance and assumes that a password
of this instance is `postgres` when establising a connection to it. You can achieve
this behaviour using the following:

```
helm upgrade --install RELEASE_NAME kts/es2loki \
  --set 'postgresql.global.postgresql.auth.postgresPassword=postgres'
```

As an alternative - please specify a correct value for the db connection string using
`stateDatabaseAddr` option from `values.yaml`.

If you don't specify `stateDatabaseAddr` and set `postgresql.enabled=false` then `es2loki`
will disable persistence at all (not recommended in production).
