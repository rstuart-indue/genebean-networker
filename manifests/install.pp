# Installs NetWorker from a repository
class networker::install {

  # first check that we can install on this OS.
  # We assume package repos for RedHat and Debian with windows systems
  # required to provide the absolute_source parameter.
  case $facts['os']['family'] {
    'RedHat','Debian','Solaris': {
    }
    default: {
      fail("${::osfamily} is not yet supported by this module.
       Please file a bug report if it should be.")
    }
  } # end case

  $components = [
    'client',
    'console',
    'nmda',
    'sap',
    'server',
    'storagenode',
    'licm',
  ]

  package { $package_client:
    ensure => $ensure_client,
  }

  package { $package_console:
    ensure => $ensure_console,
  }

  package { $package_nmda:
    ensure => $ensure_nmda,
  }

  package { $package_sap:
    ensure => $ensure_sap,
  }

  package { $package_server:
    ensure => $ensure_server,
  }

  package { $package_storagenode:
    ensure => $ensure_storagenode,
  }

  package { $package_licm:
    ensure => $ensure_licm,
  }

}
