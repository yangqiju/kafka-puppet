# kafka service
class kafka::broker::service (
  $service_install            = $kafka::broker::service_install,
  $service_ensure             = $kafka::broker::service_ensure,
  $service_requires_zookeeper = $kafka::broker::service_requires_zookeeper,
  $jmx_opts                   = $kafka::broker::jmx_opts,
  $log4j_opts                 = $kafka::broker::log4j_opts,
  $heap_opts                  = $kafka::broker::heap_opts,
  $opts                       = $kafka::broker::opts,
  $config_dir                 = $kafka::broker::config_dir,
  $service_name               = $kafka::broker::package_name,
){
  service { $service_name:
    ensure     => 'running',
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    require    => [
      Class['kafka::broker::install'],
      File["${config_dir}/server.properties"],
    ],
    subscribe  => [
      File["${config_dir}/server.properties"]
    ]
  }
}
