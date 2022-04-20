{{- define "base.ports" }}
{{- if . }}
ports:
  {{- range $i, $v := . }}
  - name: {{ $v.name }}
    containerPort: {{ $v.containerPort }}
    protocol: {{ $v.protocol | default "TCP" }}
  {{- end }}
{{- end }}
{{- end }}