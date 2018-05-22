# == Class: ood::install
class ood::install inherits ood::params {
  
  package { $ood::params::ood_pkgs: 
    ensure => 'installed' 
    require => Class['ood::repos'],
  }
}