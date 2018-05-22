# == Class: ood::service
class ood::service inherits ood::params {

  service { $ood::params::ood_service_name:
    ensure     => $ood::params::ood_service_ensure,
    enable     => $ood::params::ood_service_enable,
    hasstatus  => true,
    hasrestart => true,
  }
}