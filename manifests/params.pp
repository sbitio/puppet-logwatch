class logwatch::params (
  $log_dir          = '',
  $multiple_hosts   = false,
  $detail_level     = 'Low',
  $numeric_addreses = false
  # TO-DO logtomail or file
) {
  case $::operatingsystem {
    ubuntu, debian: {
      $package      = 'logwatch'
      $config_file  = '/etc/logwatch/conf/logwatch.conf'
    }
#    redhat, centos: {
#    }
    default: {
      fail("Unsupported platform: ${::operatingsystem}")
    }
  }
}
