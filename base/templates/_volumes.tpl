{{- define "base.volumes" }}
volumes:
  {{- range $idx, $value := .Values.volumes }}
  - name: {{ tpl $value.name $ }}
  {{- if $value.configMap }}
  {{- with $value.configMap }}
    configMap:
      name: {{ tpl .name $ }}
      {{- if .items }}
        items: 
          {{- toYaml .items | nindent 16 }}
      {{- end }}
  {{- end}}
  {{- end}}
  {{- if $value.secret }}
  {{- with $value.secret }}
    secret:
      secretName: {{ tpl .name $ }}
      {{- if .items }}
        items: 
          {{- toYaml .items | nindent 16 }}
      {{- end }}
  {{- end }}
  {{- end}}
  {{- if $value.persistence }}
  {{- with $value.persistence }}
    {{- if .existingClaim }}
    persistentVolumeClaim:
      claimName: {{ tpl .existingClaim $ }}
    {{- else if .hostPath }}
    hostPath:
      path: {{ .hostPath.path }}
      type: {{ .hostPath.type }}
    {{- end }}
  {{- end }}
  {{- end }}
    {{- if and (and (not $value.configMap) (not $value.secret)) (not $value.persistence) }}
    emptyDir: {}
    {{- end }}
  {{- end }}
{{- end }}