# qod-db

Quote of the Day database

## Troubleshooting
1) On Openshift - this won't work unless you use the below command to enable 'anyuid' perms to the openshift project where the qod-db is being deployed. This is because the mariadb docker image needs root permission to run which openshift disables by default unless 'anyuid' is used.
`oc adm policy add-scc-to-user anyuid -z default`
