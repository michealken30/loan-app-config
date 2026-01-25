{{- define "loan-validator-portal.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "loan-validator-portal.fullname" -}}
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

{{- define "loan-validator-portal.configmap" -}}
{{- include "loan-validator-portal.fullname" . }}-config
{{- end -}}

{{- define "loan-validator-portal.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "loan-validator-portal.labels" -}}
helm.sh/chart: {{ include "loan-validator-portal.chart" . }}
{{ include "loan-validator-portal.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "loan-validator-portal.selectorLabels" -}}
app.kubernetes.io/name: {{ include "loan-validator-portal.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}