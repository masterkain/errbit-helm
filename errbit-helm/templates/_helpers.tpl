{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "errbit-helm.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "errbit-helm.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "errbit-helm.mongodbURL" -}}
{{- printf "mongodb://%s:%s@%s-%s:27017/%s" .Values.mongodb.mongodbUsername .Values.mongodb.mongodbPassword .Release.Name "mongodb" .Values.mongodb.mongodbDatabase -}}
{{- end -}}
