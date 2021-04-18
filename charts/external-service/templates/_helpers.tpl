{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "externalService.name" -}}
{{- .Release.Name | trunc 63 -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "externalService.fullname" -}}
{{- .Release.Name | trunc 63 -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "externalService.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "externalService.labels" -}}
app.kubernetes.io/name: {{ include "externalService.name" . }}
helm.sh/chart: {{ include "externalService.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}
