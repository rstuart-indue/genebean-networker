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
    'nmc',
  ]

  $components.each |String $component| {
    $pkg_component = "networker::package_${component}"
    $ens_component = "networker::ensure_${component}"
    package { $pkg_component:
      ensure => $ens_component,
    }
  }

}
