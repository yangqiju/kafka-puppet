# kakfa init
class kafka::broker::config (
  $config          = $kafka::broker::config,
  $config_defaults = $kafka::broker::config_defaults,
  $install_dir     = $kafka::broker::install_dir,
  $service_restart = $kafka::broker::service_restart,
  $service_install = $kafka::broker::service_install,
  $config_dir      = $kafka::broker::config_dir,
  $service_name    = $kafka::broker::service_name,
  $log_dir         = $kafka::broker::log_dir,
) {
  validate_re($::osfamily, 'RedHat|Debian\b', "${::operatingsystem} not supported")
  #validate_absolute_path($package_dir)
  $install_directory = $install_dir ? {
    $kafka::params::install_dir => "/opt/kafka_${scala_version}-${version}",
    default                     => $install_dir,
  }

  group { $group:
    ensure => present,
    gid    => $group_id,
  }

  user { $user:
    ensure  => present,
    require => Group[$group],
    uid     => $user_id,
  }

  file { $install_directory:
    ensure  => directory,
    owner   => $user,
    group   => $group,
    require => [
      User[$user],
      Group[$group]
    ],
  }

  file { $config_dir:
    ensure => directory,
    owner  => $user,
    group  => $group,
  }

  file { $log_dir:
    ensure  => directory,
    owner   => $user,
    group   => $group,
    require => [
      Group[$group],
      User[$user],
    ],
  }

  file { "${service_name}.service":
    ensure  => file,
    path    => "/etc/init.d/${service_name}",
    mode    => '0755',
    content => template("${module_name}/init.erb"),
    before  => Service[$service_name],
  }

  $server_config = deep_merge($config_defaults, $config)

  file { "${config_dir}/server.properties":
    ensure  => present,
    owner   => $user,
    group   => $group,
    mode    => '0644',
    content => template("${module_name}/server.properties.erb"),
    notify  => Service[$service_name],
    require => File[$config_dir],
  }
  file { "${config_dir}/log4j.properties":
    ensure  => present,
    owner   => $user,
    group   => $group,
    mode    => '0644',
    content => template("${module_name}/log4j.properties.erb"),
    require => File[$config_dir],
  }
}
