{{- define "base.volumeClaimTemplates" }}
{{- if .Values.volumes }}
volumeClaimTemplates:
  {{- range $i, $v := .Values.volumes }}
  {{- if $v.persistence }}
  {{- with $v.persistence }}
  {{- if (not .existingClaim) }}
  - metadata:
      name: {{ tpl $v.name $ }}
      {{- with .annotations }}
      annotations:
        {{- toYaml . | nindent 8 }}
      {{- end }}
    spec:
      accessModes:
      {{- range .accessModes }}
        - {{ . | quote }}
      {{- end }}
      resources:
        requests:
          storage: {{ .size | quote }}
      {{ include "base.storageClass" $ }}
  {{- end }}
  {{- end }}
  {{- end }}
  {{- end }}
{{- end }}
{{- end }}