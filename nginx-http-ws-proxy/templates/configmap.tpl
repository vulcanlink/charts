{{/* vim: set filetype=mustache: */}}

{{- define "nginx-http-ws-proxy.nginx-conf" -}}
{{ printf (.Files.Get "files/nginx.conf") .Values.proxy.http .Values.proxy.ws | indent 4 }}
{{- end }}