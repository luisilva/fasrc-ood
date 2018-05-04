# == Class: ood::service
class ntp::service inherits ood::params {

  service { 'httpd24':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    require => Package['httpd24'],
  }

}