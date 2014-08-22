class logwatch::params (
  $log_dir          = '',
  $multiple_hosts   = false,
  $detail_level     = 'Low',
  $numeric_addreses = false,
  $mail_to          = '',
  # TO-DO logtomail or file
) {

  $package      = 'logwatch'
  $config_file  = '/etc/logwatch/conf/logwatch.conf'

  case $::operatingsystem {
    ubuntu, debian: {
    }
    redhat, centos: {
    }
    default: {
      fail("Unsupported platform: ${::operatingsystem}")
    }
  }

}
