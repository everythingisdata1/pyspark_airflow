{{- define "airflow.dags.volume" -}}
- name: dags
  persistentVolumeClaim:
    claimName: {{ .Values.dags.persistence.existingClaim }}
{{- end }}

{{- define "airflow.dags.volumeMount" -}}
- name: dags
  mountPath: {{ .Values.dags.persistence.mountPath }}
{{- end }}

{{- define "airflow.logs.volume" -}}
- name: logs
  persistentVolumeClaim:
    claimName: {{ .Values.logs.persistence.existingClaim }}
{{- end }}

{{- define "airflow.logs.volumeMount" -}}
- name: logs
  mountPath: {{ .Values.logs.persistence.mountPath }}
{{- end }}

{{- define "airflow.extraVolumes" -}}
{{- with .Values.extraVolumes }}
{{- toYaml . }}
{{- end }}
{{- end }}

{{- define "airflow.extraVolumeMounts" -}}
{{- with .Values.extraVolumeMounts }}
{{- toYaml . }}
{{- end }}
{{- end }}
