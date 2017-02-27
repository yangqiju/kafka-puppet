# kafka install
class kafka::broker::install(
  $package_name = $kafka::params::package_name,
) {
  package { $package_name:
    ensure => present,
  }
}
