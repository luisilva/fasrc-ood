# == Class: ood::config
class ood::config inherits ood::params {

  file { '/etc/ood/config/clusters.d/slurm.yml':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => 0644,
    content => template($module_name/slurm.yml.erb),
  }
  file { '/etc/ood/config/ood_portal.yml':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => 0644,
    content => template($module_name/ood_portal.yml.erb),
  }
  file { '/etc/ood/config/nginx_stage.yml':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => 0644,
    content => template($module_name/nginx_stage.yml.erb),
  }
}