{{- define "base.ports" }}
{{- if . }}
{{- range $i, $v := . }}
- name: {{ $v.name }}
  containerPort: {{ $v.containerPort }}
  protocol: {{ $v.protocol | default "TCP" }}
{{- end }}
{{- end }}
{{- end }}