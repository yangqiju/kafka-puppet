# kakfa init
class kafka (
  $version        = $kafka::params::version,
  $scala_version  = $kafka::params::scala_version,
  $install_dir    = $kafka::params::install_dir,
  $package_dir    = $kafka::params::package_dir,
  $package_name   = $kafka::params::package_name,
  $package_ensure = $kafka::params::package_ensure,
  $group_id       = $kafka::params::group_id,
  $user_id        = $kafka::params::user_id,
  $config_dir     = $kafka::params::config_dir,
  $log_dir        = $kafka::params::log_dir,

) inherits kafka::params {

  validate_re($::osfamily, 'RedHat|Debian\b', "${::operatingsystem} not supported")
  #validate_absolute_path($package_dir)
  $install_directory = $install_dir ? {
    $kafka::params::install_dir => "/opt/kafka_${scala_version}-${version}",
    default                     => $install_dir,
  }

}
