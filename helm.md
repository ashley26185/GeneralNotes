
helm list -a
helm install <localinstallname> <chartname>
helm rollback <localinstallname> version
helm template

# Find any errors or misconfigurations
helm lint <chartname>

helm uninstall <localinstallname>