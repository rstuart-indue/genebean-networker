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

  package { $networker::package_client:
    ensure => $networker::ensure_client,
  }

  package { $networker::package_console:
    ensure => $networker::ensure_console,
  }

  package { $networker::package_nmda:
    ensure => $networker::ensure_nmda,
  }

  package { $networker::package_sap:
    ensure => $networker::ensure_sap,
  }

  package { $networker::package_server:
    ensure => $networker::ensure_server,
  }

  package { $networker::package_storagenode:
    ensure => $networker::ensure_storagenode,
  }

  package { $networker::package_licm:
    ensure => $networker::ensure_licm,
  }

}
