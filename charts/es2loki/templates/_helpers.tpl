{{/*
Expand the name of the chart.
*/}}
{{- define "es2loki.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "es2loki.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "es2loki.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "es2loki.labels" -}}
helm.sh/chart: {{ include "es2loki.chart" . }}
{{ include "es2loki.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "es2loki.selectorLabels" -}}
app.kubernetes.io/name: {{ include "es2loki.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "es2loki.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "es2loki.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
PostgreSQL addr for es2loki persistence
*/}}
{{- define "es2loki.stateDatabaseAddr" -}}
{{- if .Values.stateDatabaseAddr }}
{{- .Values.stateDatabaseAddr }}
{{- else if .Values.postgresql.enabled }}
{{- printf "postgres://postgres:postgres@%s-postgresql.%s:5432/postgres" .Release.Name .Release.Namespace }}
{{- end }}
{{- end }}
