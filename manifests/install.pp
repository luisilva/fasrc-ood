# == Class: ood::install
class ood::install inherits ood::params {

  package { 'ruby22':
    ensure => installed,
  }

}