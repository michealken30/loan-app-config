{{/*
Return the fully qualified name of the chart
*/}}
{{- define "observability.fullname" -}}
{{- printf "%s-%s" .Release.Name "observability" | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/*
Return the labels for all resources
*/}}
{{- define "observability.labels" -}}
app.kubernetes.io/name: {{ include "observability.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Return the selector labels for Deployment/StatefulSet
*/}}
{{- define "observability.selectorLabels" -}}
app.kubernetes.io/name: {{ include "observability.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
