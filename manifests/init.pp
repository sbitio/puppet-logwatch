# logwatch
#
# This class is responsible for installing and configuring the logwatch service
#
class logwatch (
  $ensure      = 'present',
  $autoupgrade = false
) {

  require logwatch::params

  $package      = $logwatch::params::package
  $config_file  = $logwatch::params::config_file

  case $ensure {
    /(present)/: {
      $dir_ensure = 'directory'
      $package_ensure = $autoupgrade ? {
        true    => 'latest',
        false   => 'present',
        default => 'present'
      }
    }
    /(absent)/: {
      $package_ensure = 'absent'
      $dir_ensure = 'absent'
    }
    default: {
      fail('ensure parameter must be present or absent')
    }
  }

  package { $package:
    ensure => $package_ensure,
  }

  file { $config_file:
    ensure  => $ensure,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('logwatch/logwatch.conf.erb'),
    require => Package[$package],
  }

}
