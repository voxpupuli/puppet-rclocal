# Class: rclocal
#
# Manages /etc/rc.local file inserting a /etc/rc.local.d/ directory where
# each script is managaed by Puppet
#
# Usage:
# include rclocal
#
class rclocal(
  $templatepath = params_lookup( 'templatepath' ),
  $templatefile = params_lookup( 'templatefile' )
  ) inherits rclocal::params {

  file { '/etc/rc.local':
    ensure  => present,
    path    => $rclocal::configfile,
    mode    => '0755',
    owner   => 'root',
    group   => 'root',
    content => template("${rclocal::templatepath}/${rclocal::templatefile}"),
  }

  file { '/etc/rc.local.d':
    ensure  => directory,
    path    => $rclocal::configdir,
    mode    => '0755',
    owner   => 'root',
    group   => 'root',
    purge   => true,
    recurse => true,
  }

}
