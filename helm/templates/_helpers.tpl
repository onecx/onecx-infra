{{- define "app.fullname" -}}
    {{ .Release.Name }}-{{ .Values.name | default .Chart.Name }}
{{- end -}}

{{- define "app.product.name" -}}
    {{ .Release.Name }}
{{- end -}}

{{- define "app.labels.common" -}}
version: {{ .Chart.Version | replace "+" "_" }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
app.kubernetes.io/managed-by: {{ .Release.Service | quote }}
app.kubernetes.io/name: {{ template "app.fullname" $ }}
{{- end -}}

{{- define "grafana.ext.prometheus.server.fullname" -}}
{{- if .Values.grafana.ext.datasources.prometheus.url -}}
{{- .Values.grafana.ext.datasources.prometheus.url -}}
{{- else -}}
{{- printf "htt://%s-%s:%d" .Release.Name .Values.grafana.ext.datasources.prometheus.host (.Values.grafana.ext.datasources.prometheus.port | int) -}}
{{- end -}}
{{- end -}}