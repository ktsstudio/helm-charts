# Prometheus Selectel Exporter

A Prometheus exporter for Selectel services ([Github](https://github.com/ktsstudio/selectel-exporter)). 

This chart bootstraps an exporter deployment on a Kubernetes cluster using the Helm package manager.

Get Repo Info
```shell
helm repo add kts https://charts.kts.studio
helm repo update
```
See helm repo for command documentation.

# Installation

### Install chart 
```shell
helm install [RELEASE_NAME] --set selectel.token=<token>,selectel.region=<region> kts/selectel-exporter
```

### Uninstall Chart
```shell
helm uninstall [RELEASE_NAME]
```

This removes all the Kubernetes components associated with the chart and deletes the release.


# Upgrading Chart
```shell
helm upgrade [RELEASE_NAME] kts/selectel-exporter --install
```

The simplest way to update is to do a force upgrade, which recreates the resources by doing a delete and an install.
```shell
helm upgrade [RELEASE_NAME] kts/selectel-exporter --force
```

# Configuration
See Customizing the Chart Before Installing. To see all configurable options with detailed comments, visit the chart's values.yaml, or run these configuration commands:

```shell
helm show values kts/selectel-exporter
```

Chart specific settings:

| Variable                         | Help                                                                                             |
|----------------------------------|--------------------------------------------------------------------------------------------------|
| selectel.token                   | Selectel API token. It can be obtained in this [section](https://my.selectel.ru/profile/apikeys) |
| selectel.region                  | Region of your Selectel resources                                                                |
| serviceMonitor.enabled           | should be set to true to enable prometheus-operator discovery of this service                    |
| serviceMonitor.interval          | interval is the interval at which metrics should be scraped, default value is 60s                |
| serviceMonitor.scrapeTimeout     | timeout after which the scrape is ended                                                          |
| serviceMonitor.additionalLabels  | set of additional labels to add to the ServiceMonitor                                            |
| serviceMonitor.jobLabel          | value of metric`s label job                                                                      |
| serviceMonitor.targetLabels      | transfers labels from the Kubernetes Service onto the created metrics.                           |
| serviceMonitor.podTargetLabels   | transfers labels on the Kubernetes Pod onto the created metrics.                                 |
| serviceMonitor.metricRelabelings | MetricRelabelConfigs to apply to samples before ingestion.                                       |

Other collector flags can be found in the values.yaml
