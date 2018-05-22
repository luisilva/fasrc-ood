# == Class: ood::service
class ood::service inherits ood::params {

  service { $ood_service_name:
    ensure     => $ood_service_ensure,
    enable     => $ood_service_enable,
    hasstatus  => true,
    hasrestart => true,
  }
}