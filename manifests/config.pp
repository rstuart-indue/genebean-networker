# Configures the NetWorker client
class networker::config {
  case $facts['os']['family'] {
    'RedHat', 'Debian' : {
      file { '/nsr':
        ensure => 'directory',
        before => File['/nsr/res'],
      }

      file { '/nsr/res':
        ensure => 'directory',
        before => File['/nsr/res/servers'],
      }

      $lservers = $networker::servers
      file { '/nsr/res/servers':
        ensure  => 'present',
        content => template('networker/servers.erb'),
        notify  => Service['networker'],
      }

    } # end RedHat / Debian

    default: {
      fail("${::osfamily} is not yet supported by this module.
       Please file a bug report if it should be.")
    }

  } # end case

}
