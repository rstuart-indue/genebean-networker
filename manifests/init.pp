# == Class: networker
#
# This module installs the EMC NetWorker backup client. It is assumed that
# the installation packages are available via a repository the client has
# access to.
#
# === Parameters
#
#   See README.md for parameter info.
#   Each $ensure_(component) is expected to contain either a version string
#   or 'absent' or 'present'. For windows clients it must be either 'absent' or
#   the specific version required - a windows package specific issue
#
# === Examples
#
#  class { 'networker':
#    ensure_setting => 'present',
#    servers        => ['server1.example.com', 'server2.example.com'],
#  }
#
#  class { 'networker':
#    ensure_setting => 'present',
#  }
#
class networker (
  Array[String] $servers,
  String $connection_portrange,
  String $service_portrange,
  $package_client,
  $package_console,
  $package_nmda,
  $package_sap,
  $package_server,
  $package_storagenode,
  $package_licm,
  $ensure_client,
  $ensure_console,
  $ensure_nmda,
  $ensure_sap,
  $ensure_server,
  $ensure_storagenode,
  $ensure_licm,
  Optional[String] $absolute_source = undef,
) {

  contain ::networker::install
  contain ::networker::config
  contain ::networker::service

  Class['::networker::install']
  -> Class['::networker::config']
  ~> Class['::networker::service']
} # end networker
