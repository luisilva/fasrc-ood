# == Class: ood::config
class ood::config inherits ood::params {

  file { '/etc/ood/config/clusters.d/slurm.yml':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => 0644,
    content => template($module_name/slurm.yml.erb),
  }

}