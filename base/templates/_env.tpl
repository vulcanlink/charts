{{- define "base.env" }}
{{- if .Values.env }}
{{- with .Values.env }}
env:
  {{- if .fieldRef }}
  {{- range $i, $v := .fieldRef }}
  - name: {{ $v.name }}
    valueFrom:
      fieldRef:
        fieldPath: {{ $v.fieldPath }}
  {{- end }}
  {{- end }}
  {{- if .configMapKeyRef }}
  {{- range $i, $v := .configMapKeyRef }}
  - name: {{ $v.name }}
    valueFrom:
      configMapKeyRef:
        name: {{ tpl $v.configMap $ }}
        key: {{ $v.name }}
  {{- end }}
  {{- end }}
  {{- if .secretKeyRef }}
  {{- range $i, $v := .secretKeyRef }}
  - name: {{ $v.name }}
    valueFrom:
      secretKeyRef:
        name: {{ tpl $v.secret $ }}
        key: {{ $v.name }}
  {{- end }}
  {{- end }}
{{- end }}
{{- end }}
{{- end }}