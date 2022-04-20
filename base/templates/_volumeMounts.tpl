{{- define "base.volumeMounts" }}
{{- if . }}
volumeMounts:
  {{- range $i, $v := . }}
  - name: {{ $v.name }}
    mountPath: {{ $v.mountPath }}
  {{- end}}
{{- end }}
{{- end }}