# == Class: ood
#
# Full description of class ood here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'ood':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2018 FASRC, unless otherwise noted.
#
class ood (

  ## Packages
  $package_name		= $ood::params::module_package_name,

  ## Services
  $service_name		= $ood::params::module_service_name,

  ## Dirs
  $config_dir		= $ood::params::module_config_dir,
  $service_dir		= $ood::params::module_service_dir,
  $home			= $ood::params::module_home,

  ## Conf Files
  $config_file		= $ood::params::module_config_file,
  $service_file		= $ood::params::module_service_file,

  ## settings
  $module_settings	= $ood::params::module_settings,
) inherits ood::params {

  # validate parameters here
  validate_hash($settings)
  validate_string($package_name)

  class { 'ood::repos': } ->
  class { 'ood::install': } ->
  class { 'ood::config': } ~>
  class { 'ood::service': } ->
  Class['ood']
}
