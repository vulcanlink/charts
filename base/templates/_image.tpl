{{- define "base.image" }}
{{- if . }}
image: "{{ .repository }}:{{ .tag }}"
imagePullPolicy: {{ .pullPolicy | default "IfNotPresent" }}
command: 
  {{- toYaml .command | nindent 2 }}
args: 
  {{- toYaml .args | nindent 2 }}
{{- end }}
{{- end }}