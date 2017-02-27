# kafka broker
class kafka::broker (
  $version                    = $kafka::params::version,
  $scala_version              = $kafka::params::scala_version,
  $install_dir                = $kafka::params::install_dir,
  $mirror_url                 = $kafka::params::mirror_url,
  $config                     = {},
  $config_defaults            = $kafka::params::broker_config_defaults,
  $install_java               = $kafka::params::install_java,
  $package_dir                = $kafka::params::package_dir,
  $service_install            = $kafka::params::broker_service_install,
  $service_ensure             = $kafka::params::broker_service_ensure,
  $service_restart            = $kafka::params::service_restart,
  $service_requires_zookeeper = $kafka::params::service_requires_zookeeper,
  $jmx_opts                   = $kafka::params::broker_jmx_opts,
  $heap_opts                  = $kafka::params::broker_heap_opts,
  $log4j_opts                 = $kafka::params::broker_log4j_opts,
  $opts                       = $kafka::params::broker_opts,
  $group_id                   = $kafka::params::group_id,
  $user_id                    = $kafka::params::user_id,
  $config_dir                 = $kafka::params::config_dir,
  $service_name               = $kafka::params::service_name,
) inherits kafka::params {
  validate_re($::osfamily, 'RedHat|Debian\b', "${::operatingsystem} not supported")
  validate_hash($config)
  #validate_absolute_path($package_dir)
  validate_bool($service_install)
  validate_re($service_ensure, '^(running|stopped)$')
  validate_bool($service_restart)

  class { '::kafka::broker::install': } ->
  class { '::kafka::broker::config': } ->
  class { '::kafka::broker::service': } ->
  Class['kafka::broker']

}
