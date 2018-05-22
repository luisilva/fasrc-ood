# Params class
class ood::params (
  $ood_pkgs           = ['ondemand','centos-release-scl'],
  $ood_service_name   = ['httpd24-httpd'],
  $ood_service_ensure = 'running',
  $ood_service_enable = true,
){
}