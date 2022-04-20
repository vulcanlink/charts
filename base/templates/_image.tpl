{{- define "base.image" }}
image: "{{ .repository }}:{{ .tag }}"
imagePullPolicy: {{ .pullPolicy }}
command: 
  {{- toYaml .command | nindent 2 }}
args: 
  {{- toYaml .args | nindent 2 }}
{{- end }}